/***********************************************************************
 **
 ** Copyright (C) The MITRE Corporation 2012
 **
 **  Author: Stephen Jones
 **  Date: 21 Mar 2012
 **
 **  Revision History
 **  Date      Change
 **  21 Mar 2012 Initial revision
 **
 **	Used by jserver of TC_C_762_base-ex1
 **
 **  Main will run as a standalone application. The program will read the filename
 **  of an existing .wav file, read the appropriate parameters from the header, and
 **  create an output file that contains the first second of audio data from the
 **  wave file.
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
 **
 **
 ** I/0 Pairs:
 **   Good: 1st Set: test_pcm.wav
 **         2nd Set:
 **         3rd Set:
 **         4th Set:
 **         5th Set:
 **    Bad: 1st Set: test_pcm_bad.wav
 **         2nd Set:
 **
 ** How program works:
 **     The application expects command-line parameters for the input and output
 **  files, and will be run like this:
 **
 **  		main -i test_pcm.wav -o output.pcm
 ************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>

#include <sys/socket.h>       /*  socket definitions        */
#include <sys/types.h>        /*  socket types              */
#include <arpa/inet.h>        /*  inet (3) funtions         */
#include <unistd.h>           /*  misc. UNIX functions      */
#include <netinet/in.h>

/*  Global constants  */

#define MAX_LINE           1000
#define LISTENQ        1024   /*  Backlog for listen()   */
#define BUFSZ			1024

#define DEFAULT_PORT   9083

#define MAX_RETRY  10

/*  Function declarations  */

int ParseCmdLine(int argc, char *argv[], char **szAddress, char **szPort);

FILE * openFile(char *name, char *mode)
{
	FILE *fp;

	if ((fp = fopen(name, mode)) != NULL)
	{
		return fp;
	}

	fprintf(stderr, "Can't open file: %s\n", name);
	exit(EXIT_FAILURE);
}

ssize_t WriteSocket(int sockd, char * filepath ) {
	size_t nleft;
	ssize_t nwritten;
	char buffer[BUFSZ];
	int rsize = 0;
	ssize_t n = 0;
	FILE * in;

	fprintf(stderr, "open input file: %s\n", filepath);
	in = openFile(filepath, "r");

	while ((rsize = fread(buffer, 1, 1024, in)) > 0) {
		if ((nwritten = write(sockd, buffer, rsize)) <= 0) {
			if (errno == EINTR)
				nwritten = 0;
			else
				return -1;
		}
		n += nwritten;
	}

	return n;
}



/*  main()  */

int main(int argc, char *argv[]) {

	int conn_s; /*  connection socket         */
	int num_retries; /*  num of times to try server*/
	short int port; /*  port number               */
	struct sockaddr_in servaddr; /*  socket address structure  */
	char buffer[MAX_LINE]; /*  character buffer          */
	char *szAddress = "127.0.0.1"; /*  Holds remote IP address   */
	char *szPort; /*  Holds remote port         */
	char *endptr; /*  for strtol()              */
	char *filepath;

	short msgnum = 0;

	/*  Get command line arguments. should be a file path  */
	if (argc > 1) {
		filepath = (char *) malloc(strlen(argv[1])+1);
		strcpy(filepath, argv[1]);
	} else {
		fprintf(stderr, "Need to specify input file\n");
		exit(EXIT_FAILURE);
	}

	// ParseCmdLine(argc, argv, &szAddress, &szPort);


	FILE *fi2;
	fi2 = fopen("test.txt", "w");
	fprintf(fi2, "Test Test");
	fclose(fi2);

	/*  Set the remote port  */

	port = DEFAULT_PORT;

	/*  Create the socket  */

	if ((conn_s = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0) {
		fprintf(stderr, "ECHOCLNT: Error creating listening socket.\n");
		exit(EXIT_FAILURE);
	}

	/*  Set all bytes in socket address structure to
	 zero, and fill in the relevant data members   */

	memset(&servaddr, 0, sizeof(servaddr));
	servaddr.sin_family = AF_INET;
	servaddr.sin_port = htons(port);

	/*  Set the remote IP address  */

	if (inet_aton(szAddress, &servaddr.sin_addr) <= 0) {
		fprintf(stderr, "ECHOCLNT: Invalid remote IP address.\n");
		exit(EXIT_FAILURE);
	}

	/*  connect() to the remote echo server  */

	num_retries = MAX_RETRY;
	while (num_retries--) {
		/* connect socket */
		if (connect(conn_s, ((struct sockaddr*) (&servaddr)),
				((socklen_t) sizeof(servaddr))) < 0) {
			fprintf(stderr, "ECHOCLNT: Tried to connect, now waiting\n");
			sleep(5);
		} else {
			break;
		}

		if (1 == num_retries) {
			fprintf(stderr, "ECHOCLNT: Error calling connect()\n");
			exit(EXIT_FAILURE);
		}
	}

	/*  Get string to echo from user  */

	/* printf("Enter the string to echo: ");
	 fgets(buffer, MAX_LINE, stdin); */
	// strncpy(buffer, messages[msgnum], strlen(messages[msgnum]));

	//strcpy(buffer, "12345");


	/*  Send data to server  */

	WriteSocket(conn_s, filepath);

	FILE *fi;
	fi = fopen("echo.txt", "w");
	fprintf(fi, "Echo response: %s", buffer);
	fclose(fi);

	return EXIT_SUCCESS;
}

int ParseCmdLine(int argc, char *argv[], char **szAddress, char **szPort) {

	int n = 2;

	while (n < argc) {
		if (!strncmp(argv[n], "-a", 2) || !strncmp(argv[n], "-A", 2)) {
			*szAddress = argv[++n];
		} else if (!strncmp(argv[n], "-p", 2) || !strncmp(argv[n], "-P", 2)) {
			*szPort = argv[++n];
		} else if (!strncmp(argv[n], "-h", 2) || !strncmp(argv[n], "-H", 2)) {
			printf("Usage:\n\n");
			printf("    timeclnt msgnum -a (remote IP) -p (remote port)\n\n");
			exit(EXIT_SUCCESS);
		}
		++n;
	}

	return 0;
}
