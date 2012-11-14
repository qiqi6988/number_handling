/************************************************************************
**
** Copyright (C) The MITRE Corporation 2012
**
**  Author: Galen Williamson
**  Date: 19 Mar 12
**
**  Revision History
**  Date      Change
**	19 Mar 12 Initial implementation
**
**	Description:
**		This program is a very simple implementation of the standard "head"
**		unix command.
**
**  Spreadsheet Rev #: 1
**  CWE #: 839  Numeric Range Comparison Without Minimum Check
**
**		Description Summary
**  		BTC for CWE-839 (Numeric Range Comparison Without Minimum Check)
**  		that can cause an infinite or near-infinite loop, initially
**  		targeting loop-related control flow.
**
**		Extended Description
**
**			This program is a naive implementation of the standard "head"
**			unix command.  It takes an optional line count (default 10)
**			preceded by "-n" on the command line, followed by an optional file
**			name (default stdin).  It then reads and prints to stdout the given
**			number of lines from the given file.
**
**		Implementation Description
**
**			The program does not check the numeric line count argument to
**			ensure it is positive before beginning a loop that decrements this
**			value and continues while this value is non-zero.  If the line
**			count argument given is negative, then the counter will have to
**			underflow and wrap completely around before reaching zero.  In the
**			worst case, if -1 is specified on the command line, 2^64 lines will
**			be printed, since the count variable is declared long long.
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
**   Good: 1st Set:
**         2nd Set:
**         3rd Set:
**         4th Set:
**         5th Set:
**    Bad: 1st Set:
**         2nd Set:
**
************************************************************************/

/* This define can be set to 0 to disable the weakness */
#define BOUND_CHECK 1

#include <stdlib.h>
#include <stdio.h>

int main(int argc, char **argv)
{
	char line[1024];
	long long count = 10;
	int i;
	FILE *file = stdin;

	for (i = 1; i < argc; i++) {
		if (argv[i][0] == '-') {
			if (argv[i][1] == 'n') {
				if (i + 1 < argc) {
					count = atoll(argv[++i]); //STONESOUP:INTERACTION_POINT
				}
				else {
					puts("-n argument specified without line count\n");
					return(-1);
				}
			}
		}
		else {
			file = fopen(argv[i], "r");
			printf("file: %s", file);
			if (! file) {
				perror("Could not open file");
				return(-1);
			}
		}
	}

	/* Defect part 1: we don't check that count is positive */
#if BOUND_CHECK
	while (count--) { //STONESOUP:CROSSOVER_POINT
#else
	while (count-- > 0) {
#endif
		char *s;
		s = fgets(line, sizeof(line), file);
		/* Defect part 2: if we comment out this if, then the program will
		 * print the last line of the file over and over until it wraps
		 * around to zero.
		 */
//		if (s)
			printf("%s", line); //STONESOUP:TRIGGER_POINT
	}

	fclose(file);

	return(0);
}
