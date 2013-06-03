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
** Derived From: TC_C_839_base1
**
** Variant Author: Galen Williamson
**
** Technical Impact: Read application data
**
** Variant Features:
**		SOURCE_TAINT:COMMAND_LINE
**		DATA_TYPE:SIGNED_LONG
**		DATA_FLOW:INDEX_ALIAS_1
**		CONTROL_FLOW:INTERPROCEDURAL
**
** Initial Testing: (x means yes, - means no)
**   Tested in MS Windows XP 32bit        -
**   Tested in MS Windows 7  64bit        -
**   Tested in Ubuntu10_10 Linux 32bit    -
**   Tested in Ubuntu10_10 Linux 64bit    x
**
** Workflow:
**   Created: 4/4/2012
**   1st Vett:
**   2nd Vett:
**   3rd Vett: <teamleader> on <date>
**   4th Vett: Fortify Issues Fixed on <date>
**   5th Vett: Tested in Harness on <date>
**
**
** I/0 Pairs:
**   Good: 1st Set:
**         2nd Set:
**         3rd Set:
**         4th Set:
**         5th Set:
**    Bad: 1st Set:
**
************************************************************************/

/* This define can be set to 0 to disable the weakness */
#define BOUND_CHECK 1

#include <stdlib.h>
#include <stdio.h>

void head(signed long count, FILE *file) //STONESOUP:CONTROL_FLOW:INTERPROCEDURAL
{
	char line[1024];
	int i = 0;

	while (count--) { //STONESOUP:DATA_TYPE:SIGNED_LONG
		fgets(line, sizeof(line), file);
		printf("%s", line); //STONESOUP:TRIGGER_POINT
		if (i == 100)
		{
			i = 0;
			sleep(1);
		}
		i++;
	}
}

int main(int argc, char **argv)
{
	signed long count[5];
	int x = 0;
	int *y = &x;
	int i;
	FILE *file = stdin;

	count[0] = 10;

	for (i = 1; i < argc; i++) {
		if (argv[i][0] == '-') {
			if (argv[i][1] == 'n') {
				if (i + 1 < argc) {
					count[0] = atoll(argv[++i]); //STONESOUP:INTERACTION_POINT //STONESOUP:SOURCE_TAINT:COMMAND_LINE
				}
				else {
					puts("-n argument specified without line count\n");
					return(-1);
				}
			}
		}
		else {
			file = fopen(argv[i], "r");
			if (! file) {
				perror("Could not open file");
				return(-1);
			}
		}
	}

	if (count[0] > 2000) { //STONESOUP:CROSSOVER_POINT
	  perror("argument is too large; maximum is 2000");
	  return(-1);
	}
	head(count[*y], file); //STONESOUP:DATA_FLOW:INDEX_ALIAS_1

	fclose(file);

	return(0);
}
