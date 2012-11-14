/*******************************************
 **
 ** Copyright (C) 2011 The MITRE Corporation. ALL RIGHTS RESERVED
 **
 ** Author: Mitchell Wills
 ** Date: 6/16/2011
 **
 ** Base Test Program -- countlines.c
 **
 ** Variant Test Case Program
 ** Variant Author: Stephen Jones
 **  Derived From: TC_C_196_base
 **  Technical Impact: Segmentation fault
 **
 ** This Base Test Program counts the number of lines of code in a Java
 ** Program ignoring whitespace and comment lines.   This variant will
 ** receive a program from a network socket.  This program just looks for comments
 ** that follow the Java language specification.
 **
 ** Error: main calls istrlen, a custom string length program that can return
 **        a negative error value if a bad character is encountered. When triggered
 **        a cast to an unsigned integer is done to the return value without checking the value
 **        (CWE-196)
 **
 ** STONESOUP Weakness Class: Number Handling
 ** CWE ID: CWE-196
 ** Variant Spreadsheet Rev #: 2
 ** Variant Spreadsheet ID: vx73
 **
 ** Variant Features:
 **		SOURCE_TAINT: SOCKET
 **		DATA_TYPE: STRUCT
 **		DATA_FLOW: ADDRESS_AS_A_FUNCTION_RETURN_VALUE
 **		CONTROL_FLOW: END_CONDITION_CONTROLLED_LOOP
 **
 ** Workflow:
 **   Created:6/16/2011
 **   1st Vett: <programmer> on <date>
 **   2nd Vett: <peer> on <date>
 **   3rd Vett: <teamleader> on <date>
 **   4th Vett: Fortify Issues Fixed on <date>
 **   5th Vett: Tested in Harness on <date>
 **
 **
 ** I/0 Pairs:
 **   Good: 1st Set: 1.java
 **         2nd Set: 3.java
 **         3rd Set: 4.java
 **         4th Set: 5.java
 **         5th Set:
 **    Bad: 1st Set: 1bad.java
 **
 ** How program works:
 **     The application takes parameters on the command line, one for the port
 **     to listen to, and a second for the output file that it'll write:
 **
 **  		main -p [port] -o output.pcm
 **
 **  	A separate client application will stream the data to the main program:
 **
 **  		jclient2 -p [port] -i ../testData/1.java
 ************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <unistd.h>
#if _WIN32
#else
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>
#endif
#include "istrlen.h"

#define DEBUG 0
#define BUFFER_SIZE 1024
#define LISTENQ		1024
#define SERVER_PORT "9099"

struct input_t {
	char * data;
	struct input_t *next_line;
};

void usage(const char * prog_name) {
	fprintf(stderr, "Usage %s -o <output_file> [options]\n"
		"Options:\n"
		"  -o 				-- Output file\n", "  -p				-- Port number\n",
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

ssize_t Readline(int sockd, void *vptr, size_t maxlen) {
	ssize_t n, rc;
	char c, *buffer;

	buffer = vptr;

	for (n = 1; n < maxlen; n++) {
		if ((rc = read(sockd, &c, 1)) == 1) {
			*buffer++ = c;
			if (c == '\n')
				break;
		} else if (rc == 0) {
			if (n == 1) {
				return 0;
			} else {
				break;
			}
		} else {
			return -1;
		}
	}

	*buffer = 0;
	return n;
}

struct input_t * ReceiveFile(int sockd) {

	char buffer[BUFFER_SIZE];
	char line[256];

	int bsize = 0;
	int rsize, len;
	struct input_t * input = NULL;
	struct input_t * last_line = NULL;
	struct input_t * first_line = NULL;
	size_t buffer_used = 0;
	size_t buffer_remaining = sizeof(buffer) - buffer_used;

	while (Readline(sockd, line, 256) > 0) {
		//fprintf(stdout, "line: %s\n", line);
		len = strlen(line);
		if (len > 0) {
			input = (struct input_t *) malloc(sizeof(struct input_t));
			if (first_line == NULL)
				first_line = input;
			input->data = (char *) malloc(len);
			memcpy(input->data, line, len);
			input->next_line = NULL;
			if (last_line != NULL)
				last_line->next_line = (struct input_t *) input;
			last_line = input;
		}

	}

	return first_line;
}

int main(int argc, char *argv[]) {
	FILE *fp, *out;
	char line[256];
	struct input_t * doc = (struct input_t *) malloc(sizeof(struct input_t));

	char *line_pointer;

	int line_already_counted;
	int multi_line_comment;
	int total_lines;
	int lines_of_code;
	int code, port = 0;
	int list_s; /*  listening socket          */
	int conn_s; /*  connection socket         */
	char * szPort = SERVER_PORT;

	unsigned char i;

	char * input_name = NULL;
	char * output_name = NULL;
	uint16_t len;

	struct sockaddr_in sin;

	//input_t * doc;
	int opts = 1;

	extern char *optarg;
	extern int optind;

	for (;;) {
		int c = getopt(argc, argv, "hp:o:");
		if (c == -1)
			break;
		switch (c) {
		case 'h':
			usage(argv[0]);
			return 0;
		case 'o':
			output_name = optarg;
			break;
		case 'p':
			szPort = optarg;
			break;
		}
	}

	/* SMC - avoid NULL deref if output name isn't provided. */
	if (output_name == NULL) {
		fprintf(stderr, "No output file specified with -o option\n");
		exit(EXIT_FAILURE);
	}

	if ((port = atoi(szPort)) == 0) {
		fprintf(stderr, "Error reading port value with -p option\n");
		exit(EXIT_FAILURE);
	}

	/*Initialize socket values*/
	memset(&sin, 0, sizeof(sin));
	sin.sin_family = AF_INET;
	sin.sin_addr.s_addr = INADDR_ANY;
	sin.sin_port = htons(port);

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
	if (bind(list_s, (struct sockaddr *) &sin, sizeof(sin)) < 0) {
		fprintf(stderr, "bind failed with an error\n");
		perror("ERROR");
		exit(EXIT_FAILURE);
	}

	/*Listen for incoming connections*/
	if (listen(list_s, LISTENQ) < 0) {
		fprintf(stderr, "listen failed with error\n");
		exit(EXIT_FAILURE);
	}

	fprintf(stderr, "Socket created.  Ready to accept on port %d.\n", port);
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
	doc = ReceiveFile(conn_s); // STONESOUP:DATA_FLOW:ADDRESS_AS_A_FUNCTION_RETURN_VALUE

	/*  Close the connected socket  */

	if (close(conn_s) < 0) {
		fprintf(stderr, "WAVESRV: Error calling close()\n");
		exit(EXIT_FAILURE);
	}

	if (doc == NULL) {
		fprintf(stderr, "No valid document received\n");
		exit(EXIT_FAILURE);
	}

	// Open the output file.

	//fp = openFile(input_name, "r");
	out = openFile(output_name, "w+");


	// After initializing variables, loop through each line of the file using fgets().  The function
	// fgets(str, num, fp) reads up to num - 1 characters from the file stream fp and dumps them
	// into str. fgets() will stop when it reaches the end of a line, in which case str will be
	// terminated with a newline. If fgets() reaches num - 1 characters or encounters the EOF,
	// str will be null-terminated. fgets() returns str on success, and NULL on an error.

	multi_line_comment = 0;
	total_lines = 0;
	lines_of_code = 0;

	memset(line, '\0', 256);

	for (; doc != NULL; doc = (struct input_t *) doc->next_line) {
		strcpy(line, doc->data);
		total_lines++;

		// We are reading a new line so we need to reset the line_already_counted flag since
		// it obviously hasn't been counted yet.

		line_already_counted = 0;

		// Since fgets() may terminate a string with a newline ... we need to strip any trailing
		// '\n' and replace it with a NULL character.

		if (line[strlen(line) - 1] == '\n')
			line[strlen(line) - 1] = '\0';

		// Set the line_pointer to the first character of the line.

		line_pointer = line;

		// We are now ready to parse the line character by character.

		while (*line_pointer != '\0') {
			// If we are currently in a multi line scenario, then we need to check if we have hit
			// an end tag.  Otherwise we just advance the pointer and keep looping.

			if (multi_line_comment == 1) {
				if (*line_pointer == '*') {
					// Advance the line_pointer.  We need to check for the NULL character
					// and break if found. If we don't do this, then the next line_pointer++
					//call (before the start of the next iteration) will advance us out of bounds.

					line_pointer++;
					if (*line_pointer == '\0')
						break;

					if (*line_pointer == '/') {
						// An end tag has been found!  Reset the multi_line_comment.
						// Note that we still need to advance the pointer and continue
						// the loop.

						multi_line_comment = 0;
					}
				}

				line_pointer++;
				continue;
			}

			// If the current character is a whitespace, then skip it and continue the loop
			// inorder to examine the next character.

			if (isspace(*line_pointer) != 0) {
				line_pointer++;
				continue;
			}

			// If the current character is a slash, then we need to look at the following
			// character to see if the line is a Java comment.  If we are looking at a Java
			// comment line, then just break out of the loop without incrementing the
			// line counter.

			if (*line_pointer == '/') {
				// Advance the line_pointer.  We need to check for the NULL character
				// and break if found. If we don't do this, then the next line_pointer++
				//call (before the start of the next iteration) will advance us out of bounds.

				line_pointer++;
				if (*line_pointer == '\0')
					break;

				// If the next character is a slash as well, then a single line comment has
				// been found.  The rest of this line is not code, so break out of this loop.

				if (*line_pointer == '/')
					break;

				// If the next character is an asterisk, then a multi-line comment has been
				// found.  We now need to skip every line until the end of the comment. To
				// do this, we will turn on the multi_line_comment flag and continue
				// processing this line (and any following line) looking for the closing tag.
				//Note that the end of the comment may contain code on the rest of the
				// line after the closing comment tag.

				if (*line_pointer == '*') {
					multi_line_comment = 1;
					line_pointer++;
					continue;
				}

				// Note that if we reach here, a Java comment was NOT found, so we should
				// fall through to the default processing and count the current line as a
				// valid line of code.
			}

			// A line of Java code has been found!  If the line has not already been counted, then
			// increment the line counter.

			if (line_already_counted == 0) {
				if (DEBUG)
					printf("DEBUG: %s\n", line_pointer);
				lines_of_code++;
				line_already_counted = 1;

				len = istrlen(line) + 1;
				char * lineout = (char *) malloc(len);
				memcpy(lineout, line, len);
				strcat(lineout, "\n");
				fputs(lineout, out);
			}

			// copy this line to the output


			// Move the line pointer to the next character in the line so that the next
			// iteration of the current loop doesn't try to process the same character.

			line_pointer++;
		}
	}

	// We are done with the file so close it.

	if (fclose(out)) {
		printf("\nERROR: File close error.\n");
		return (EXIT_FAILURE);
	}

	// We have finished looking at each line in the file, and now have the line count.  So print it!!

	if (DEBUG)
		printf(
				"\nDEBUG: The file '%s' contains %d total lines, of which %d are code.\n\n",
				input_name, total_lines, lines_of_code);
	printf("\nRESULT: %d", lines_of_code);

	return (EXIT_SUCCESS);
}

/* End of file */
