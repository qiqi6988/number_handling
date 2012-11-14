/*******************************************
 **
 ** Copyright (C) 2011 The MITRE Corporation. ALL RIGHTS RESERVED
 **
 ** Author: Eric Pedersen
 ** Date: 9/21/11
 **
 ** Base Test Program -- cmdInterpreter.c
 ** Simple command interpreter that moves data around in simulated registers. Program consists of an array of ten integers that are
 ** treated similar to a computer registers.  You can set values, move data around, and multiply by another number.  There is also
 ** an option to take in a file with values to set the registers to.  The final option is to print a specific range of registers
 ** provided from command line.
 **
 ** Variant Test Case Program
 ** Print from register d to register n command does not properly validate array index from user.  The d value could be anything in
 ** unrestricted memory but the n can not exceed the arrays maximum size, 9.
 **
 ** STONESOUP Weakness Class: Number Handling
 ** CWE ID: CWE-195
 ** Variant Spreadsheet Rev #: ###
 ** Variant Spreadsheet ID: ###
 **
 ** Derived From: TC_C_129_base1
 **
 ** Variant Author: Galen Williamson
 **
 ** Technical Impact: Read application data (buffer overread caused by implicit signed to unsigned conversion)
 **
 ** Variant Features:
 **		SOURCE_TAINT:COMMAND_LINE
 **		DATA_TYPE:ARRAY_LENGTH_NONLINEAR_EXPRESSION
 **		DATA_FLOW:ADDRESS_AS_A_NON_LINEAR_EXPRESSION
 **		CONTROL_FLOW:INDIRECTLY_RECURSIVE
 **
 ** Initial Testing: (x means yes, - means no)
 **   Tested in MS Windows XP 32bit        -
 **   Tested in MS Windows 7  64bit        -
 **   Tested in Ubuntu10_10 Linux 32bit    -
 **   Tested in Ubuntu10_10 Linux 64bit    x
 **
 ** Workflow:
 **   Created: 4/6/2012
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
 ** I/0 Pairs:
 **   Good: 1st Set: 305 312 328 337 346 351 366 372 384 396 208 6 output.txt 7 1 9
 **         2nd Set:
 **    Bad: 1st Set: 7 -2659 9
 *********************************************/
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include <assert.h>

int getInteger(char *input);
void copyRegs(int *registers, unsigned int i, unsigned int end, FILE* otfil);

void copyReg(int *registers, unsigned int i, unsigned int end, FILE* otfil)
{
	int n = 2;
	int value = *(registers + (int) (n * n - 4 + (3 - 2) * i)); //STONESOUP:TRIGGER_POINT //STONESOUP:DATA_FLOW:ADDRESS_AS_A_NON_LINEAR_EXPRESSION
	//print the contents
	printf("Register %d is: %d\n", i, value);
	//Copy everything into one string
	fprintf(otfil, "Register %d is: %d\n", i, value);
	copyRegs(registers, ++i, end, otfil); //STONESOUP:CONTROL_FLOW:INDIRECTLY_RECURSIVE
}

void copyRegs(int *registers, unsigned int i, unsigned int end, FILE* otfil)
{
	if (i < end) {
		copyReg(registers, i, end, otfil);
	}
}

int main(int argc, char *argv[])
{
	int nn = 2;
	int holder = 1;
	int buffers[3][(nn * nn) * 3 - 2]; //STONESOUP:DATA_TYPE:ARRAY_LENGTH_NONLINEAR_EXPRESSION

#define registers buffers[1]
#define prebuf buffers[0]
#define pstbuf buffers[2]

	int *point;
	FILE *otfil;

	printf("Registers are:\n\n 1 2 3 4 5 6 7 8 9 0\n");
	printf(
			"The following commands are acceptable:\n"
					"100 - halts and quits\n"
					"2dn - Sets register d to n. Example 234\n"
					"3dn - Add n to register d\n"
					"4dn - Multiply register d by n Example 459\n"
					"5dn - Print register d.  Sample 59\n"
					"6 output.txt - Get the next argument containing the filename to import. The file contains values to set the registers to.\n"
					"7 d n - Print from register d to register n. Make sure you include spaces between the start and end indexes."
					"Sample 7 5 9\n\n");

	memset(registers, 0, sizeof(registers));
	memset(prebuf, 'A', sizeof(prebuf));
	memset(pstbuf, 'A', sizeof(pstbuf));

	point = registers;

	while (holder < argc) {
		printf("Command: %s\n", argv[holder]);
		int d = argv[holder][1] - 48;
		int n = argv[holder][2] - 48;

		/*
		 * Set register d to n
		 * Sample 259; (reg 5) = 9
		 */
		if (argv[holder][0] == '2') {
			printf("Set register d %d to n %d (between 0 and 9) \n", d, n);
			point = &registers[d];
			int cpy = registers[n];
			*point = cpy;
			printf("Register d is %d\n", registers[d]);
		} else

		/*
		 * Add n to register d
		 * Sample 359; (reg 5) = (reg 5) + 9
		 */
		if (argv[holder][0] == '3') {
			printf("Add n %d to register d %d \n", n, d);
			*point = registers[d];
			int cpy = registers[d];
			cpy += n;
			registers[d] = cpy;
			printf("Register d is %d\n", registers[d]);
		} else

		/*
		 * Multiply register d by n
		 * Sample 459; (reg 5) = (reg 5) * (reg 9)
		 */
		if (argv[holder][0] == '4') {
			printf("Multiply register d %d by n %d\n", d, n);
			registers[d] = registers[d] * registers[n];
			printf("Register d is %d\n", registers[d]);
		} else

		/*
		 * Print register d
		 * Sample 59; prints the contents of register 9
		 */
		if (argv[holder][0] == '5') {
			if (d > 9) {
				printf("Invalid register %d", d);
			} else {
				printf("Print register %d\nRegister %d is: %d\n", d, d,
						registers[d]);
			}
		} else

		/*
		 * Get the next argument containing the filename to import.
		 * The file contains values to set the registers to.
		 * Sample 6 output.txt;
		 */
		if (argv[holder][0] == '6') {
			printf("Set up register from file %s\n", argv[holder + 1]);
			char *buffer;
			char number[10] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
			int result, i, y, x = 0, place = 0;

			if ((otfil = fopen(argv[holder + 1], "rb")) == NULL)
			{
				fprintf(stderr, "Unable to open file because of error\n");
				return (1);
			}
			// allocate memory to contain the whole file:
			buffer = (char*) malloc(sizeof(char) * 100);
			if (buffer == NULL) {
				fputs("Memory error", stderr);
				exit(2);
			}
			// copy the file into the buffer:
			result = fread(buffer, 1, 100, otfil);

			printf("Contents: %s\n", buffer);

			for (i = 0; i < 100; i++) {
				if (place >= 10)
					break;
				if (buffer[i] == 32 || buffer[i] == 0) {
					registers[place] = (int) atoi(number);
					place++;
					for (y = 0; y < 10; y++) {
						number[y] = 0;
					}
					x = 0;
				} else {
					number[x] = buffer[i];
					x++;
				}
			}
			//Close file handle
			fclose(otfil);
			free(buffer);

		} else

		/*
		 * Print from register d to register n
		 * Sample 7 5 9; prints the contents from register 5 to 9
		 */
		if (argv[holder][0] == '7') {
			unsigned int i, start, end;

			start = getInteger(argv[holder + 1]);
			end = getInteger(argv[holder + 2]); //STONESOUP:INTERACTION_POINT //STONESOUP:SOURCE_TAINT:COMMAND_LINE //STONESOUP:CROSSOVER_POINT
			printf("Print registers %d - %d\n", start, end);

			if (start > end) {
				printf("d is larger than n. Invalid input: %d %d", d, n);
			}
			fprintf(stderr, "Output filename '%s'\n", argv[argc - 1]);
			if ((otfil = fopen(argv[argc - 1], "wb")) == NULL)
			{
				fprintf(stderr,
						"Unable to create output file because of error\n");
				return (1);
			}

			copyRegs(registers, start, end, otfil);

			fclose(otfil);
		} else if (!strcmp(argv[holder], "100")) {
			printf("Found halt %s\n", argv[holder]);
			exit(-1);
		} else {
			printf("Command not found!\n");
		}
		if (argv[holder][0] == '7') {
			holder += 4;
		} else if (argv[holder][0] == '6') {
			holder += 2;
		} else {
			holder++;
		}
		printf("\n\n");
	}
	return 0;
}

int getInteger(char *input){
	return atoi(input);
}

