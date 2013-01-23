/***********************************************************************
 **
 ** Copyright (C) The MITRE Corporation 2012
 **
 **  Author: Stephen Jones
 **  Date: 21 Mar 2012
 ** 
 **  Derived From: TC_C_839_base2
 **  Technical Impact: DoS (resource consumption)
 **  Variant Author: Stephen Jones
 **
 **  Revision History
 **  Date      Change
 **  21 Mar 2012 Initial revision
 **
 **
 **  Main will run as a network application. The program will open a socket at port 9082
 **  and read the contents of a wav file streamed to it. It will calculate the appropriate
 **  parameters from the header, and create an output file that contains the first second
 **  of audio data from the wav file.
 **
 ** Error: In doConversion() when obtaining the Samplerate and Samplesize
 **        from the .wav file, the program checks the values to ensure they
 **        don't exceed a maximum value, but do not check a minimum (CWE-839).
 **        Because of this, a specially crafted .wav file could inject incorrect
 **        data into these fields, the values of which are being used to allocate
 **        a buffer to the heap (CWE-122). The overflow of the values cause a significant
 **        spike in memory usage of the application, and causes the program to
 **        output a large amount of incorrect data.
 **
 **
 ** STONESOUP Weakness Class: Number Handling
 ** CWE ID: CWE-839
 ** Variant Spreadsheet Rev #: ###
 ** Variant Spreadsheet ID: ###
 **
 ** Variant Features:
 **		STONESOUP:SOURCE_TAINT:SOCKET
 **		STONESOUP:DATA_TYPE:HEAP_POINTER
 **		STONESOUP:DATA_FLOW:ADDRESS_AS_A_FUNCTION_RETURN_VALUE
 **		STONESOUP:CONTROL_FLOW:LOOP_COMPLEXITY_TEST
 **
 ** I/0 Pairs:
 **   Good: 1st Set: test_pcm_good.wav
 **         2nd Set:
 **         3rd Set:
 **         4th Set:
 **         5th Set:
 **    Bad: 1st Set: test_pcm_bad.wav
 **         2nd Set:
 **
 ** How program works:
 **     The application takes one parameter on the command line, the output
 **     file that it'll write:
 **
 **  		main -o output.pcm
 **
 **  	A separate client application will stream the data to the main program:
 **
 **  		jclient2 ../testData/test_pcm_good.wav
 ************************************************************************/

#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>

#define MAXRATE 44100
#define MAXBITS_PER_SAMPLE 32

#define SERVER_PORT 9083
#define LISTENQ		1024
#define BUFFER_SIZE 1024
#define HEADERSIZ 44

typedef char sample_t;
typedef short int16_t;
typedef char byte_t;

FILE * openFile(char *name, char *mode);

int16_t * get16Value( byte_t array[], int16_t num_bytes ) {
	int16_t * value = (int16_t *)malloc(sizeof(int16_t));
	*value = (array[0]) | (array[1]<<8);
	return value;
}

int doConversion(byte_t *input, char *output) {
	FILE *out;
	sample_t buffer[BUFSIZ];
	size_t sample_rate, total_bytes_per_second;
	int16_t * bits_per_sample;
	char header[HEADERSIZ];
	char bps_array[2];

	size_t rd = 0, wt;

	out = openFile(output, "w+");

	// copy in the header
	memcpy(header, input, HEADERSIZ);

	sample_rate = (header[24]) | (header[25] << 8) | (header[26] << 16 ) | (header[27] << 24);

	if (sample_rate > MAXRATE) {
		fprintf(stderr, "Maximum sample rate is %d\n", MAXRATE);
		exit(EXIT_FAILURE);
	}
	if (sample_rate < 500) {
		fprintf(stderr, "Minimum sample rate is %d\n", 500);
		exit(EXIT_FAILURE);
	}

	bps_array[0] = header[34];
	bps_array[1] = header[35];

	bits_per_sample = get16Value(bps_array, 2);  //STONESOUP:DATA_FLOW:ADDRESS_AS_A_FUNCTION_RETURN_VALUE

	// get bits per sample

	// bits per sample shouldn't be over 32
	if (*bits_per_sample > MAXBITS_PER_SAMPLE) { // STONESOUP:CROSSOVER_POINT
		fprintf(stderr, "Maximum bits per sample is %d\n", MAXBITS_PER_SAMPLE);
		exit(EXIT_FAILURE);
	}

	total_bytes_per_second = *bits_per_sample * sample_rate / 8;

	// now go to data
	input += 44;

	int loop_count = 0;
	for (loop_count = 0; total_bytes_per_second > 0; loop_count++) { // STONESOUP:TRIGGER_POINT // STONESOUP:CONTROL_FLOW:LOOP_COMPLEXITY_TEST
		memcpy(buffer, input, BUFSIZ);
		if (total_bytes_per_second <= BUFSIZ) {
			wt = fwrite(buffer, total_bytes_per_second, 1, out);
			total_bytes_per_second = 0;
		} else {
			wt = fwrite(buffer, BUFSIZ, 1, out);
			total_bytes_per_second = total_bytes_per_second - BUFSIZ;
		}
		input += wt;
		if (loop_count > 2000)
			break;
	}

	fflush(out);
	struct stat report[1];
	fstat(fileno(out), report);
	printf("Output size %jd\n", (intmax_t) report->st_size);

	/* close */
	fclose(out);
	return EXIT_SUCCESS;
}

byte_t * ReceiveAudioFile(int sockd) {

	byte_t buffer[BUFFER_SIZE];
	byte_t * input = NULL;
	byte_t * ptr;
	int bsize = 0;
	int rsize;

	//input = Readline(sockd);
	while ((rsize = read(sockd, buffer, BUFFER_SIZE)) > 0) {  // STONESOUP:SOURCE_TAINT:SOCKET // STONESOUP:INTERACTION_POINT
		input = (byte_t *) realloc(input, bsize + rsize);
		ptr = input + bsize;
		memcpy(ptr, buffer, rsize);  // STONESOUP:DATA_TYPE:HEAP_POINTER
		bsize += rsize;
	}

	return input;
}

void usage(const char * prog_name) {
	fprintf(stderr, "Usage %s -o <output_file> [options]\n"
		"Options:\n"
		"  -h               -- print this message\n", prog_name);
}

FILE * openFile(char *name, char *mode) {
	FILE *fp;

	if ((fp = fopen(name, mode)) != NULL) {
		return fp;
	}

	fprintf(stderr, "Can't open file: %s\n", name);
	exit(EXIT_FAILURE);
}

int main(int argc, char * argv[]) {
	char * output_name = NULL;
	int samplerate = MAXRATE;
	int code, port = 0;
    int       list_s;                /*  listening socket          */
    int       conn_s;                /*  connection socket         */

    struct sockaddr_in sin;

	int opts = 1;

	extern char *optarg;
	extern int optind;

	byte_t * wave_data;

	for (;;) {
		int c = getopt(argc, argv, "hs:o:");
		if (c == -1)
			break;
		switch (c) {
		case 'h':
			usage(argv[0]);
			return 0;
		case 'o':
			output_name = optarg;
			break;
		}
	}

	/* SMC - avoid NULL deref if output name isn't provided. */
	if (output_name == NULL) {
	  fprintf(stderr, "No output file specified with -o option\n");
	  exit(EXIT_FAILURE);
	}
	/*Initialize socket values*/
	memset(&sin, 0, sizeof(sin));
	sin.sin_family = AF_INET;
	sin.sin_addr.s_addr = INADDR_ANY;
	sin.sin_port = htons(SERVER_PORT);

	/*Create server listening socket*/
	if ((list_s = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0) {
		fprintf(stderr, "socket failed with error\n");
		exit(EXIT_FAILURE);
	}


	/*Allow this port to be reused*/
	if (setsockopt(list_s, SOL_SOCKET, SO_REUSEADDR, (char *) &opts,
			sizeof(opts)) < 0) {
		fprintf(stderr, "setsockopt failed with error\n");
		exit(EXIT_FAILURE);
	}

	/*Bind to the specified port and address*/
	if ( bind(list_s, (struct sockaddr *) &sin, sizeof(sin)) < 0) {
		fprintf(stderr, "bind failed with an error\n");
		exit(EXIT_FAILURE);
	}
	/*Listen for incoming connections*/
	if (listen(list_s, LISTENQ) < 0) {
		fprintf(stderr, "listen failed with error\n");
		exit(EXIT_FAILURE);
	}

	fprintf(stderr, "Socket created.  Ready to accept.\n");
	fflush(stderr);

	fprintf(stderr, "WAVESRV: waiting for a connection\n");
	fflush(stderr);

	/*  Wait for a connection, then accept() it  */

	if ((conn_s = accept(list_s, NULL, NULL)) < 0) {
		fprintf(stderr, "ECHOSERV: Error calling accept()\n");
		exit(EXIT_FAILURE);
	}

	fprintf(stderr, "WAVESRV: Connected!\n");
	fflush(stderr);

	/*  Retrieve an input line from the connected socket
	 then simply write it back to the same socket.     */

	wave_data = ReceiveAudioFile(conn_s);

	/*  Close the connected socket  */

	if (close(conn_s) < 0) {
		fprintf(stderr, "WAVESRV: Error calling close()\n");
		exit(EXIT_FAILURE);
	}

	/* attempt to write first second */

	code = doConversion(wave_data, output_name);

	exit(code);
}
