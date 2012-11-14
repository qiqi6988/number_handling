/*******************************************
**
** Copyright (C) 2011 The MITRE Corporation. ALL RIGHTS RESERVED
**
** Revised December 2011, lmonk
** Author: Mitchell Wills
** Date: 6/16/2011
**
** Base Test Program -- countlines.c
** (most comments removed from std code)
**
** STONESOUP Weakness Class: Number Handling
** CWE ID: CWE-196
** Variant Spreadsheet Rev #: 2
** Variant Spreadsheet ID: 522
**
** Variant Features:
**		SOURCE_TAINT:COMMAND_LINE
**		DATA_TYPE:ARRAY_LENGTH_LITERAL
**		DATA_FLOW:ARRAY_INDEX_CONSTANT
**		CONTROL_FLOW:SEQUENCE
**
*********************************************/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define DEBUG 0

// function prototypes
int checkargs ( int number_of_args, char **arg_array );
int nsquaredplusone ( int n );

// square input and add 1
int nsquaredplusone ( int n )
{
  return ( (n*n) + 1 );
}

// returns 0 if OK, -1 if not exactly two args or if 2nd < 0 or > 2
int checkargs ( int number_of_args, char **arg_array )
{
  if ( (number_of_args != 3) || ( atoi(arg_array[2]) < 0 ) || ( atoi(arg_array[2]) > 2 ) )	//STONESOUP:DATA_FLOW:ARRAY_INDEX_CONSTANT
    {
      return( -1 );
    }

  return 0;
}

int main (int argc, char *argv[])	//STONESOUP:INTERACTION_POINT	//STONESOUP:CONTROL_FLOW:SEQUENCE
{
	FILE *fp;

	char * filename;
	char line[256];	//STONESOUP:DATA_TYPE:ARRAY_LENGTH_LITERAL

	char *line_pointer;

	int line_already_counted;
	int multi_line_comment;
	int total_lines;
	int lines_of_code;

	// variables specifically for cwe
	int * silly_array;
	int silly_array_length;
	int j;

	// this may be fairly large because of conversion error
	int good = (int ) ( ( unsigned char ) checkargs( argc, argv ) );	//STONESOUP:CROSSOVER_POINT	//STONESOUP:TRIGGER_POINT	//STONESOUP:SOURCE_TAINT:COMMAND_LINE

	// create the array -- freed at end
	silly_array = calloc ( nsquaredplusone ( good ), sizeof ( int ) );
	if ( silly_array == NULL )
	  {
	    printf ( "allocation error\n" );
	    exit ( 1 );
	  }

	// fill the array
	silly_array_length = nsquaredplusone ( good );
	for ( j = 0; j < silly_array_length; j++ )
	  {
	    silly_array[ j ] = j;
	  }
	// we are tired from all of that prep work
	// sleep a while, or forever if we are really too tired
	while ( j > 0 )
	  {
	    j--;
	    sleep ( j * 20 );
	    // this is to ensure that there will eventually be
	    // an availability DOS
	    if ( j > 100 )
	      {
		while ( 0 == 0 )
		  {
		    j++;
		    j--;
		  }
	      }
	  }

	/////////////////////////////////////////////////////////////////////
	//
	// proceed with countlines program as usual
	//
	////////////////////////////////////////////////////////////////////

	filename = argv[1];


	// Open the file in readonly mode.

	fp = fopen(filename, "r");
	if (fp == NULL)
	{
		printf("\nERROR: Cannot open file.\n");
		return(EXIT_FAILURE);
	}

	multi_line_comment = 0;
	total_lines = 0;
	lines_of_code = 0;

	memset(line, '\0', 256);

	while (fgets(line,256,fp) != NULL)
	{
		total_lines++;

		line_already_counted = 0;

		if (line[strlen(line)-1] == '\n') line[strlen(line)-1] = '\0';

		line_pointer = line;

		// We are now ready to parse the line character by character.

		while (*line_pointer != '\0')
		{
			if (multi_line_comment == 1)
			{
				if (*line_pointer == '*')
				{
					line_pointer++;
					if (*line_pointer == '\0') break;

					if (*line_pointer == '/')
					{
						multi_line_comment = 0;
					}
				}

				line_pointer++;
				continue;
			}

			if (isspace(*line_pointer) != 0)
			{
				line_pointer++;
				continue;
			}

			if (*line_pointer == '/')
			{
				line_pointer++;
				if (*line_pointer == '\0') break;

				if (*line_pointer == '/') break;

				if (*line_pointer == '*')
				{
					multi_line_comment = 1;
					line_pointer++;
					continue;
				}
			}

			// increment the line counter.
			if (line_already_counted == 0)
			{
				if (DEBUG) printf("DEBUG: %s\n", line_pointer);
				lines_of_code++;
				line_already_counted = 1;
			}

			line_pointer++;
		}
	}

	// We are done with the file so close it.

	if (fclose(fp))
	  {
	    printf("\nERROR: File close error.\n");
	    return(EXIT_FAILURE);
	  }

	// free silly_array
	free ( silly_array );

	printf("%d\n", lines_of_code);

	return(EXIT_SUCCESS);
}

/* End of file */
