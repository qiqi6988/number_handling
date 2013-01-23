/*****************************************************************************
**
** Copyright (C) 2011 The MITRE Corporation. ALL RIGHTS RESERVED
**
** HIJACKED FROM: v527, lmonk, December 2011
**
**	Base Test Program -- countlines.c
**
******************************************************************************
**
** NOW PARALLEL TO TC_C_190_v526
** using Read Memory Technical Impact instead of DOS (resource consumption)
**
******************************************************************************
**
**  Spreadsheet Rev #: 2
**  CWE #: 194
**  Spreadsheet Variant: 526
**		SOURCE_TAINT:COMMAND_LINE
**		DATA_TYPE:ARRAY_LENGTH_NONLINEAR_EXPRESSION
**		DATA_FLOW:ADDRESS_AS_A_CONSTANT
**		CONTROL_FLOW:CONDITIONAL
**
*****************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <unistd.h>                  /* sleep                                */
#ifdef _WIN32

#else
#define __USE_XOPEN		     /* Need this for the shm.h include      */
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#endif

/********** DEFINES **********/
#define MAX_KEY      (9999)          /* arbitrary bounds on key values       */
#define MIN_KEY      (5000)          /* arbitrary bounds on key values       */
#define MAX_RETRY    (10)            /* num times to try file remove         */
#define MAX_MSG      (256)           /* limit messages to 256 chars          */
#define DEBUG 0

int main (int argc, char *argv[])
{
  int   shmem_id;                    /* id for shared mem allocation         */
  key_t key;                         /* key for allocating shmem             */
  char *shm;                         /* pointer to shmem                     */
  FILE *lockfile;                    /* fh for lockfile                      */
  int   retries;                     /* num times to retry file removal      */

	FILE *fp;
	int i;  // loop variable

	int x = 16;
	char filename[x * x];	//STONESOUP:DATA_TYPE:ARRAY_LENGTH_NONLINEAR_EXPRESSION
	char line[256];

	char *line_pointer;
	char place = 0; // introduced to keep track of place in line (lmonk)

	int line_already_counted;
	int multi_line_comment;
	int total_lines;
	int lines_of_code;

	char max_line_length; // from second argument
	unsigned int  remaining_chars; // dynamic remaining allowable length

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
	    printf("error allocating config_data\n");
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

	// second argument now used
	if (argc != 2)
	{
		printf("\nERROR: Usage: %s <key>\n", argv[0]);
		return(EXIT_FAILURE);
	}

  /* get the key */
  key = (int)strtol(argv[1], (char **)NULL, 10);

  /* Make sure port number is between 8k and 10k */
  if( MAX_KEY < key || MIN_KEY > key )
    {
      printf("Please provide a key between %d and %d\n", MIN_KEY, MAX_KEY);
      exit(1);
    }

  /* get and attach to shmem */
  if( 0 > (shmem_id = shmget( key, MAX_MSG, IPC_CREAT | 0666 )))
    {
      printf("Error getting shmem, exiting...\n");
      exit(1);
    }

  shm = shmat( shmem_id, NULL, 0 );//STONESOUP:SOURCE_TAINT:SHARED_MEMORY
  if( ((char*)(-1)) == shm )
    {
      printf("Error attaching to memory, exiting...\n");
      exit( 1 );
    }


  /* check for lockfile, if it exists then there is a request */
  while(access("lockfile", F_OK) != 0)
    {
  		sleep(1);
    }

  shm[MAX_MSG-1] = '\0';
  /* This (filename copy) follows the example given in the test case generation
   * plan for array content value. If this is no good let me (Conor) know and
   * I can use something else */
  sscanf(shm, "%s %d", filename, ((int*)(&max_line_length)));	//STONESOUP:DATA_FLOW:ARRAY_CONTENT_VALUE

  filename[255] = '\0';


	// check max_line_length
	if ( ( max_line_length < 1 ) || ( max_line_length > 120 ) )
	  {
	    printf("Error: max_line_length is %d, but must be >=1 and <= 120\n", max_line_length );
	    exit(1);
	  }

	// as in countlines.c normally
	for (i=0;i<255;i++)
	{
		if (filename[i]=='\0') break;

		if (filename[i]=='\\' || filename[i]=='/')
 		{
 			printf("\nERROR: Filename must not contain a slash character.\n");
 			return(EXIT_FAILURE);
 		}

		if (filename[i]==':')
		{
			printf("\nERROR: Filename must not contain a colon character.\n");
			return(EXIT_FAILURE);
		}

		if (filename[i]=='.' && filename[i+1]=='.')
		{
			printf("\nERROR: Filename must not contain a double dot (e.g. '..') sequence.\n");
			return(EXIT_FAILURE);
		}
	}

	// Open the file in readonly mode.
	fp = fopen(filename, "r");
	if (fp == NULL)
	{
		printf("\nERROR: Cannot open file.\n");
		return(EXIT_FAILURE);
	}

	fprintf(stderr, "Opened '%s'\n", filename);
	// After initializing variables, loop through each line of the file using fgets().  The function
	// fgets(str, num, fp) reads up to num - 1 characters from the file stream fp and dumps them
	// into str. fgets() will stop when it reaches the end of a line, in which case str will be
	// terminated with a newline. If fgets() reaches num - 1 characters or encounters the EOF,
	// str will be null-terminated. fgets() returns str on success, and NULL on an error.

	multi_line_comment = 0;
	total_lines = 0;
	lines_of_code = 0;

	memset(line, '\0', 256);

	while ( (fgets(line,256,fp) != NULL) && ( place <= max_line_length ) )
	{
		total_lines++;

		// We are reading a new line so we need to reset the line_already_counted flag since
		// it obviously hasn't been counted yet.

		line_already_counted = 0;

		// Since fgets() may terminate a string with a newline ... we need to strip any trailing
		// '\n' and replace it with a NULL character.

		if (line[strlen(line)-1] == '\n') line[strlen(line)-1] = '\0';

		// Set the line_pointer to the first character of the line.

		line_pointer = line;
		place = 0;

		// We are now ready to parse the line character by character.

		while ( *line_pointer != '\0' )
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
					place++;  // track pointer increment
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
				place++; //track pointer increment
				continue;
			}

			// If the current character is a whitespace, then skip it and continue the loop
			// inorder to examine the next character.

			if (isspace(*line_pointer) != 0)
			{
				line_pointer++;
				place++; // track pointer increment
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
				place++; // track pointer increment
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
					place++; // track pointer increment
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
				if (DEBUG) printf("DEBUG: %s\n", line_pointer);
				lines_of_code++;
				line_already_counted = 1;
			}

			// Move the line pointer to the next character in the line so that the next
			// iteration of the current loop doesn't try to process the same character.

			line_pointer++;
			place++; // track pointer increment
		}
	}

	// We are done with the file so close it.

	 if (fclose(fp))
	 {
		printf("\nERROR: File close error.\n");
		return(EXIT_FAILURE);
	 }

	 if ( place > max_line_length )
	   {
	     remaining_chars = ( unsigned int ) (max_line_length - place);

             /* This "if" statement does nothing -- changes CONDITIONAL to
	      * ELSE_CONDITIONAL for CONTROL_FLOW */
             if( remaining_chars <= 0 )	//STONESOUP:CROSSOVER_POINT
               {
                 /* all is good, do nothing */
               }
	     // next condition should be impossible!!
	     else		//STONESOUP:CONTROL_FLOW:ELSE_CONDITIONAL
	       {
	    	 output_data_index = 0;//STONESOUP:TRIGGER_POINT
	       }
	     //printf( "remaining_chars: %u\n", remaining_chars );
	   }

	 ////////////////////////////////////////////////////////////////////
	 //
	 // HIJACK: disclose secret if bad input, otherwise benign_junk
	 //
	 ////////////////////////////////////////////////////////////////////

  snprintf( shm, MAX_MSG, "%s %d", config_data[output_data_index], lines_of_code );
  shm[MAX_MSG-1] = '\0';

  remove("lockfile");

  /* Wait for client to process message */
  while( shm[0] != 0 )
    {
  		sleep(1);
    }

  shmdt(shm);
  shmctl( shmem_id, IPC_RMID, 0 );

  return(EXIT_SUCCESS);
}

/* End of file */
