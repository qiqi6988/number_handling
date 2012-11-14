/************************************************************************
**
** Copyright (C) The MITRE Corporation 2011
**
**  Author: $ Jacqueline  Bow
**  Date: $ June 15, 2011
**
**  Spreadsheet Rev #: 2
**  CWE #: 190
**  Spreadsheet Variant: 499
**		SOURCE_TAINT:FILE_CONTENTS
**		DATA_TYPE:ARRAY_LENGTH_FUNCTION_RETURN_VALUE
**		DATA_FLOW:ARRAY_INDEX_LINEAR_EXPRESSION
**		CONTROL_FLOW:INDIRECTLY_RECURSIVE
**
**  Revision History
**  revised November, 2011, lmonk: infinite loop bad behavior
**  Date  6/16/2011 (initial creation)
**
**  STONESOUP: Annotations:
**  FEATURE: array_length_function_return_value
**  DATA_FLOW_FEATURE: array_index_linear_expression
**  START_CONDITION_CONTROLLED_LOOP
**  SOURCE_TAINT:FILE_CONTENTS STONESOUP:
**  INTERACTION_POINT
**  CROSSOVER_POINT
**  TRIGGER_POINT
**  TECHNICAL_IMPACT:DOS:Resource_consumption
**  WEAKNESS:numeric_type_allows_overflow
**
**
************************************************************************/

// � 2011 The MITRE Corporation. ALL RIGHTS RESERVED

/*
Base Test Program -- countlines.c
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define DEBUG 0

void foo(int x)	//STONESOUP:CONTROL_FLOW:INDIRECTLY_RECURSIVE
{
	if (x == 0)
		return;
	bar(x-1);
}

void bar(int x)
{
	foo(x);
}

int main (int argc, char *argv[])
{
	FILE *fp;

	int func(){	//STONESOUP:DATA_TYPE:ARRAY_LENGTH_FUNCTION_RETURN_VALUE

		return 256;
	}
	char filename[func()];
	char line[func()];

	char *line_pointer;

	int line_already_counted;
	int multi_line_comment;
	char lines_of_code; //WEAKNESS:numeric_type_allows_overflow

	int i, x, y, z;



	// An incorrect number of arguments were supplied.  Let the user know the expected format of
	// the command line.  One user supplied argument is expected.  Remember that the first argument
	// is always the program name so we really need to check that 2 arguments exist.

	if (argc != 2)
	{
		fprintf(stderr,"\nERROR: Usage: countlines <filename>\n");
		return(EXIT_FAILURE);
	}

	// Get the input that was supplied on the command line.  One argument should be there.  This
	// argument is the name of the .java file that is being counted.
	//
	// For the file name argument, this code will only grab the first 255 characters from the
	// command line argument, placing a NULL terminator at the end.

	memset(filename, '\0', 256);
	strncpy(filename, argv[1], 255);
	y = 200;
	z = 55;
	filename[y+z] = '\0';	//STONESOUP:DATA_FLOW:ARRAY_INDEX_LINEAR_EXPRESSION

	x = 8;
	foo(x); // Initiates beginning of FUNCTION_INVOCATION_INDIRECTLY_RECURSIVE
	// Validate that the filename provided is just a filename and not a path to some other
	// directory.  We do this through a blacklist that excludes slashes (both forward and
	// backward) and the double dot sequence.
	//
	// Note that we only loop from 0 to 255 since the last character should be a NULL
	// and there is no need to double check this.  In addition, this guards against any
	// possible buffer overread when we check filename[i+1].

	for (i=0;i<255;i++)
	{
		if (filename[i]=='\0') break;

		if (filename[i]=='\\' || filename[i]=='/')
		{
			fprintf(stderr,"\nERROR: Filename must not contain a slash character.\n");
			return(EXIT_FAILURE);
		}

		if (filename[i]==':')
		{
			fprintf(stderr,"\nERROR: Filename must not contain a colon character.\n");
			return(EXIT_FAILURE);
		}

		if (filename[i]=='.' && filename[i+1]=='.')
		{
			fprintf(stderr,"\nERROR: Filename must not contain a double dot (e.g. '..') sequence.\n");
			return(EXIT_FAILURE);
		}
	}

	// Open the file in readonly mode.

	fp = fopen(filename, "r");
	if (fp == NULL)
	{
		fprintf(stderr,"\nERROR: Cannot open file.\n");
		return(EXIT_FAILURE);
	}

	// After initializing variables, loop through each line of the file using fgets().  The function
	// fgets(str, num, fp) reads up to num - 1 characters from the file stream fp and dumps them
	// into str. fgets() will stop when it reaches the end of a line, in which case str will be
	// terminated with a newline. If fgets() reaches num - 1 characters or encounters the EOF,
	// str will be null-terminated. fgets() returns str on success, and NULL on an error.

	multi_line_comment = 0;
	lines_of_code = 0;

	memset(line, '\0', 256);

	while (fgets(line,256,fp) != NULL)	//STONESOUP:SOURCE_TAINT:FILE_CONTENTS	//STONESOUP:INTERACTION_POINT
	{

		if ( lines_of_code < 0 )	//STONESOUP:CROSSOVER_POINT
		{
		   while ( 0 == 0 )	//STONESOUP:TRIGGER_POINT	// TECHNICAL_IMPACT:DOS:Resource_consumption
		   { lines_of_code++; }
		}

		// We are reading a new line so we need to reset the line_already_counted flag since
		// it obviously hasn't been counted yet.
		line_already_counted = 0;

		// Since fgets() may terminate a string with a newline ... we need to strip any trailing
		// '\n' and replace it with a NULL character.

		if (line[strlen(line)-1] == '\n') line[strlen(line)-1] = '\0';

		// Set the line_pointer to the first character of the line.

		line_pointer = line;

		// We are now ready to parse the line character by character.

		while (*line_pointer != '\0')
		{
			// If we are currently in a multi line scenario, then we need to check if we have hit
			// an end tag.  Otherwise we just advance the pointer and keep looping.

			if (multi_line_comment == 1)
			{
				if (*line_pointer == '*')
				{
					// Advance the line_pointer.  We need to check for the NULL character
					// and break if found. If we don't do this, then the next line_pointer++
					//call (before the start of the next iteration) will advance us out of bounds.

					line_pointer++;
					if (*line_pointer == '\0') break;

					if (*line_pointer == '/')
					{
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

			if (isspace(*line_pointer) != 0)
			{
				line_pointer++;
				continue;
			}

			// If the current character is a slash, then we need to look at the following
			// character to see if the line is a Java comment.  If we are looking at a Java
			// comment line, then just break out of the loop without incrementing the
			// line counter.

			if (*line_pointer == '/')
			{
				// Advance the line_pointer.  We need to check for the NULL character
				// and break if found. If we don't do this, then the next line_pointer++
				//call (before the start of the next iteration) will advance us out of bounds.

				line_pointer++;
				if (*line_pointer == '\0') break;

				// If the next character is a slash as well, then a single line comment has
				// been found.  The rest of this line is not code, so break out of this loop.

				if (*line_pointer == '/') break;

				// If the next character is an asteric, then a multi-line comment has been
				// found.  We now need to skip every line until the end of the comment. To
				// do this, we will turn on the multi_line_comment flag and continue
				// processing this line (and any following line) looking for the closing tag.
				//Note that the end of the comment may contain code on the rest of the
				// line after the closing comment tag.

				if (*line_pointer == '*')
				{
					multi_line_comment = 1;
					line_pointer++;
					continue;
				}

				// Note that if we reach here, a Java comment was NOT found, so we should
				// fall through to the default processing and count the current line as a
				// valid line of code.
			}

			// A line ofJava code has been found!  If the line has not already been counted, then
			// increment the line counter.

			if (line_already_counted == 0)
			{
				lines_of_code++;
				line_already_counted = 1;
			}

			// Move the line pointer to the next character in the line so that the next
			// iteration of the current loop doesn't try to process the same character.

			line_pointer++;
		}
	}

	// We are done with the file so close it.

	 if (fclose(fp))
	 {
		fprintf(stderr,"\nERROR: File close error.\n");
		return(EXIT_FAILURE);
	 }

	// We have finished looking at each line in the file, and now have the line count.  So print it!!
	printf("\nRESULT: %d", lines_of_code);

	return(EXIT_SUCCESS);
}

/* End of file */

