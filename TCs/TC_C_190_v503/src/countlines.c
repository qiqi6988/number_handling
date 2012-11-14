/*******************************************
**
** Copyright (C) 2011 The MITRE Corporation. ALL RIGHTS RESERVED
**
** HIJACKED FROM:
**
**  Author: $ Jacqueline  Bow
**  Date: $ June 16, 2011
**
**  Spreadsheet Rev #: 2
**  CWE #: 190
**  Spreadsheet Variant: 503
**		SOURCE_TAINT:FILE_CONTENTS
**		DATA_TYPE:WIDE_CHARACTER
**		DATA_FLOW:ARRAY_INDEX_VARIABLE
**		CONTROL_FLOW:START_CONDITION_CONTROLLED_LOOP
**
*********************************************/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define DEBUG 0

int main (int argc, char *argv[])
{
	FILE *fp;

	int x = 128;
	int y = 2;

	char filename[x*y];

	char line[x*y];

	char *line_pointer;

	int line_already_counted;
	int multi_line_comment;
	char lines_of_code; //WEAKNESS:numeric_type_allows_overflow

	int i;

	wchar_t wide_slash = L'/';

	////////////////////////////////////////////////////////////////////
	///
	/// set up hijack
	///
	////////////////////////////////////////////////////////////////////
	char * secret_string = "116-53-6526";
	char * public_string = "benign_junk";
	char ** config_data  = malloc ( 2 * sizeof(char *));
	if ( config_data == NULL )
	  {
	    fprintf(stderr,"error allocating config_data\n");
	    exit(1);
	  }
	config_data[0] = secret_string;
	config_data[1] = public_string;
	int output_data_index = 1;
	////////////////////////////////////////////////////////////////////
	///
	/// end hijack set-up
	///
	////////////////////////////////////////////////////////////////////

	// check args
	if (argc != 2)
	{
		fprintf(stderr,"\nERROR: Usage: %s <filename>\n", argv[0]);
		return(EXIT_FAILURE);
	}

	memset(filename, '\0', 256);
	strncpy(filename, argv[1], 255);
	filename[x*y] = '\0';	//STONESOUP:DATA_FLOW:ARRAY_INDEX_VARIABLE

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




	while  (fgets(line,256,fp) != NULL )	//STONESOUP:CONTROL_FLOW:START_CONDITION_CONTROLLED_LOOP	//STONESOUP:SOURCE_TAINT:FILE_CONTENTS	//STONESOUP:INTERACTION_POINT
	{



		if ( lines_of_code < 0 )	//STONESOUP:CROSSOVER_POINT
		{
		  output_data_index = 0;	//STONESOUP:TRIGGER_POINT	// TECHNICAL_IMPACT:READ_MEMORY
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


					if ( (( wchar_t ) *line_pointer) == wide_slash)	//STONESOUP:DATA_TYPE:WIDE_CHARACTER
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

	 ////////////////////////////////////////////////////////////////////
	 //
	 // HIJACK: disclose secret if bad input
	 //
	 ////////////////////////////////////////////////////////////////////
	 printf("%s %d\n", config_data[output_data_index], lines_of_code);

	return(EXIT_SUCCESS);
}

/* End of file */
