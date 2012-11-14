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
**  Spreadsheet Rev #: 
**
**  CWE #: 194
**
**  Spreadsheet Variant ID: TC_C_194_vx31
**
**  Derived From: TC_C_194_base
**
**  Technical Impact: Confidentiality (expose application secret)
**
**  Variant Features:
**		SOURCE_TAINT:CGI
**		DATA_TYPE:UNION
**		DATA_FLOW:ADDRESS_AS_A_VARIABLE
**		CONTROL_FLOW:INTERCLASS
**
**  Variant Author: Danny Haynes
**
** I/0 Pairs (should be passed to the client):
**   Good: 1st Set: QUERY_STRING="filename=1.java&length=70" => benign_junk 27
**         2nd Set: QUERY_STRING="filename=2.java&length=120" => benign_junk 224
**         3rd Set:
**         4th Set:
**         5th Set:
**    Bad: 1st Set: QUERY_STRING="filename=long.java&length=257" ERROR 2 (error condition)
**         2nd Set: QUERY_STRING="filename=2.java&length=90" 116-53-6526 50 (exploit weakness)
**
*****************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include "query.h"

union Data{
  char c;
  unsigned int u;
};

struct Struct1 {
  unsigned int (*function1)(union Data, char);
};

int get_input(char**, union Data*);
void print_error(int n);
unsigned int get_data_index(union Data max_line_length, char place);
int is_match(char* str1, char* str2);

int main (int argc, char *argv[])
{
	FILE *fp;
	int i;  // loop variable

	int x = 16;
	char* filename;
	char line[256];

	char *line_pointer;
	char place = 0; // introduced to keep track of place in line (lmonk)

	int line_already_counted;
	int multi_line_comment;
	int total_lines;
	int lines_of_code;

	union Data max_line_length; // from second argument
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
	    print_error(1);
	    exit(EXIT_FAILURE);
	  }
	config_data[0] = secret_string;
	config_data[1] = public_string;

	////////////////////////////////////////////////////////////////////
	///
	/// end hijack set-up
	///
	////////////////////////////////////////////////////////////////////

	// start getting file name
	filename = (char*)malloc(256);
	memset(filename, '\0', 256);
	
	// get max_line_length, which can be a char becuase it must be > 0 and <= 120	
	char** afilename = &filename;
	if (!get_input(afilename, &max_line_length)){
	  print_error(2);
	  exit(EXIT_FAILURE);
	}
	
	char** newfilename = afilename; //STONESOUP:DATA_FLOW:ADDRESS_AS_A_VARIABLE
	(*newfilename)[255] = '\0';
	
	// as in countlines.c normally
	for (i=0;i<255;i++)
	{
	  if ((*newfilename)[i]=='\0') break;
	  
	  if ((*newfilename)[i]=='\\' || (*newfilename)[i]=='/')
	    {
	      print_error(4);
	      exit(EXIT_FAILURE);
	    }
	  
	  if ((*newfilename)[i]==':')
	    {
	      print_error(5);
	      exit(EXIT_FAILURE);
	    }

	  if ((*newfilename)[i]=='.' && (*newfilename)[i+1]=='.')
	    {
	      print_error(6);
	      exit(EXIT_FAILURE);
	    }
	}
	
	// Open the file in readonly mode.

	fp = fopen(*newfilename, "r");
	if (fp == NULL)
	{
	  print_error(7);
	  exit(EXIT_FAILURE);
	}

	// After initializing variables, loop through each line of the file using fgets().  The function
	// fgets(str, num, fp) reads up to num - 1 characters from the file stream fp and dumps them
	// into str. fgets() will stop when it reaches the end of a line, in which case str will be
	// terminated with a newline. If fgets() reaches num - 1 characters or encounters the EOF,
	// str will be null-terminated. fgets() returns str on success, and NULL on an error.

	multi_line_comment = 0;
	total_lines = 0;
	lines_of_code = 0;

	memset(line, '\0', 256);

	while ( (fgets(line,256,fp) != NULL) && ( place <= max_line_length.c ) )
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
	   print_error(8);
	   exit(EXIT_FAILURE);
	 }
	 
	 struct Struct1 s1;
	 s1.function1 = get_data_index;
	 int output_data_index = s1.function1(max_line_length, place); //STONESOUP:CONTROL_FLOW:INTERCLASS
	 
	 ////////////////////////////////////////////////////////////////////
	 //
	 // HIJACK: disclose secret if bad input, otherwise benign_junk
	 //
	 ////////////////////////////////////////////////////////////////////
	 printf("Status: 200\n");
	 printf("Content-Type: text/html\n");
	 printf("\n");
	 printf("<html><body>%s %d</body></html>\n",config_data[output_data_index], lines_of_code);

	 return(EXIT_SUCCESS);
}

/* This function gets the index used to look up the configuration data */
unsigned int get_data_index(union Data max_line_length, char place){
  unsigned int remaining_chars;
  int output_data_index = 1;
  
  if ( place > max_line_length.c ){
    remaining_chars = ( unsigned int ) (max_line_length.u - place);        //STONESOUP:CROSSOVER_POINT
    // next condition should be impossible!!
    if ( remaining_chars > 0 )   //STONESOUP:TRIGGER_POINT       
      {
	output_data_index = 0;
      }
  } 

  return output_data_index;
}

/* This function retrieves the filename and maximum line length from cgi. The QUERY_STRING should follow
   the format "filename=<filename>&length=<number>" where number is some value between 0 and 120.
*/
int get_input(char** afilename, union Data* max_line_length){

  char* envvar = getenv("QUERY_STRING"); //STONESOUP:INTERACTION_POINT   //STONESOUP:SOURCE_TAINT:CGI
  
  /* We failed to find the QUERY_STRING environment variable */
  if(envvar == NULL){
    printf("can't find var\n");
    return 0;
  }
  
  assoc_t query = parse_query_string(envvar);
  
  /* We failed to parse the query string */
  if(query == NULL){
    printf("can't parse query string\n");
    return 0;
  }
  
  assoc_t q = query;
  
  for (; q->key; q++){
    if (is_match(q->key,"filename")) {
      if(q->val != NULL){
        int length = strlen(q->val);
        strncpy(*afilename,q->val,length);
        (*afilename)[length] = '\0';
      }
    }else if(is_match(q->key,"length")){
      if(q->val != NULL){
	int n = atoi(q->val);
	if(n < 0 || n > 120){
	  return 0;
	}else{
	  max_line_length->c = (char) n; //STONESOUP:DATA_TYPE:UNION
	}
      }
    }else{/* We found an unrecognized key */
      printf("unrecognized key\n");
      return 0;
    }
  }
  return 1;
}

/* Print an error message with the specified error number */
void print_error(int n){
  printf("Status: 500\n");
  printf("Content-Type: text/html\n");
  printf("\n");
  printf("<html><body>ERROR %d</body></html>\n",n);
}

/* This function checks to make sure that the two strings are both the same length and that they are
   the same for their entire length.
*/
int is_match(char* str1, char* str2){

  int length;
  if ((length = strlen(str1)) == strlen(str2)){
    if (strncmp(str1,str2,length) == 0){
      return 1;
    }
  }
  return 0;
}

/* End of file */
