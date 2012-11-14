/*******************************************
**
** Copyright (C) 2011 The MITRE Corporation. ALL RIGHTS RESERVED
**
** Author: Mitchell Wills
** Date: 7/21/2011
**
** Base Test Program -- recaman.c
**
** Variant Test Case Program
**
**
** The original base was altered so that when the user enters a large sequence index the
** program gets stuck is an infinite loop. A large sequence index allows that counter that
** is used to check if a calculated value already exists to underflow. It underflows
** instead of overflowing because the counter counts backwards into the negatives and
** then the negative of the counter is used as an array index. This could be exploited if
** the program ran as the backend for a server. If the user were able to make many requests
** causing this to be called with a large sequence index then the user could perform a DOS
** attack on the server.
**
** STONESOUP Weakness Class: Number Handling
**
** CWE ID: CWE-191
**
** Variant Spreadsheet Rev #: 
**
** Variant Spreadsheet ID: TC_C_191_vx30
**
** Derived From: TC_C_191_base
**
** Variant Features:
**		SOURCE_TAINT:CGI
**		DATA_TYPE:STRUCT
**		DATA_FLOW:PASS_BY_REFERENCE
**		CONTROL_FLOW:CALLBACK
**
** Variant Author: Danny Haynes
**
** Technical Impact: DoS: Uncontrolled Exit/Crash   
**
** Initial Testing: (x means yes, - means no)
**   Tested in MS Windows XP 32bit        -
**   Tested in MS Windows 7  64bit        -
**   Tested in Ubuntu10_10 Linux 32bit    -
**   Tested in Ubuntu10_10 Linux 64bit    -
**   Tested in RHEL 5 32bit               x
**
** Workflow:
**   Created:7/21/2011
**   1st Vett: <programmer> on <date>
**   2nd Vett: <peer> on <date>
**   3rd Vett: <teamleader> on <date>
**   4th Vett: Fortify Issues Fixed on <date>
**   5th Vett: Tested in Harness on <date>
**
** I/0 Pairs:
**   Good: 1st Set: -1
**         2nd Set: 123
**         3rd Set: 0
**         4th Set: 50
**         5th Set: 1
**    Bad: 1st Set: 129
*********************************************/

//Recaman's Sequence Generator
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include "query.h"

//Struct for holding integer values.
typedef struct{
  int n;
}Integer;

//Function prototypes
int mygeti (Integer *);
int recaman(Integer);
int inSequence(int, int *, Integer*);
int compute(int(*function_1)(int, int*, Integer*), int, int*, Integer*);
int is_match(char* str1, char* str2);
void print_error(int n);

//Securely read in the input number
//Buff[7] means that a maximum of 6 digits can be read
//Any input with a 6 digits in the beginning is valid
//e.g. 123456fffff is valid but ff123456 and 1234ff6234234 are not

int mygeti(Integer *result){
  char *end, buff [7];
  /* The QUERY_STRING will take the value "seqnum = n" where n is some value. */
  char* rBuff = getenv("QUERY_STRING");	//STONESOUP:INTERACTION_POINT	//STONESOUP:SOURCE_TAINT:CGI
  
  /* We failed to find the QUERY_STRING environment variable */
  if(rBuff == NULL){
    return 0;
  }
  
  assoc_t query = parse_query_string(rBuff);
  
  /* We failed to parse the query string */
  if(query == NULL){
    return 0;
  }
  
  assoc_t q = query;
  
  for (; q->key; q++){
    if (is_match(q->key,"seqnum")) {
      if(q->val != NULL){
	strncpy(buff,q->val,7);
      }
    }else{/* We found an unrecognized key */
      return 0;
    }
  }
  /* Make sure we have a value to work with */
  result->n = (int) strtol(buff, &end, 10);
  
  return 1;
}

int main(void){
  Integer value; //STONESOUP:DATA_TYPE:STRUCT
  
  /* Report error if we have a problem getting the input. */
  if (!mygeti(&value)){
    print_error(1);
    return EXIT_FAILURE;
  }
  
  /* -1 is the "magic" value that will quit the program */
  if (value.n == -1){
    return EXIT_SUCCESS;
  }
  
  //Otherwise, send the value to the recaman function if its greater than zero
  else if (value.n >= 0) {
    int seq = recaman(value);
    if (seq != -1){
      printf("Status: 200\n");
      printf("Content-Type: text/html\n");
      printf("\n");
      printf("<html><body>%d</body></html>\n",seq);
    }else{
      print_error(2);
    }
  }else {
    print_error(3);
  }
    
  return 0;
}

//Calculate the actual sequence
//A(0) = 0. a(m) = a(m-1) - 1 if a(m) is positive and not already in the sequence, otherwise a(m) = a(m-1) + m.
//The first few numbers in the Recaman's Sequence is 0, 1, 3, 6, 2, 7, 13, 20, 12, 21, 11, 22, 10, 23, 9.
int recaman(Integer sequenceNo){
  int *sequence = NULL;
  int i;
  int currentValue;
  int outputValue = 0;
  
  //Create the dynamic array for storing the sequence
  sequence = (int*) calloc((sequenceNo.n+1),sizeof(int));
  
  //Check to make sure the calloc call succeeded
  if (sequence == NULL) {
    printf("ERROR: Calloc memory allocation failed\n");
    return -1;
  }
  
  //Setup the sequence precondition
  //a(0) = 0
  sequence[0] = 0;
  
  for (i = 1; i <= sequenceNo.n; i++) {
    currentValue = (sequence[i-1] - i);
    
    //Do the > 0 check:
    if(currentValue > 0) {
      //Check if the value has already been seen
      if (!compute(inSequence, currentValue, sequence, &sequenceNo)) { //STONESOUP:DATA_FLOW:PASS_BY_REFERENCE //STONESOUP:CONTROL_FLOW:CALLBACK
	//Add it to the sequence if not
	sequence[i] = currentValue;
      }
      else {
	//Otherwise, do the addition method and add it to the sequence
	sequence[i] = (sequence[i-1] + i);
      }
    }
    //If the value is <0 then do the addition method and add it to the sequence
    else {
      sequence[i] = (sequence[i-1] + i);
    }
  }
  
  //Set the output value
  outputValue = sequence[sequenceNo.n];
  
  //Free the dynamic array
  free(sequence);
  sequence = NULL;
  
  return outputValue;
}

//See if the input value is already in the sequence
int inSequence(int value, int *seq, Integer* size){
  char j;   
  
  for (j=0; j > -(size->n); j--) {	//STONESOUP:CROSSOVER_POINT	
    if (seq[-j] == value) {	//STONESOUP:TRIGGER_POINT	
      return 1;
    }
  }
  
  return 0;
}

/* This function serves as a callback function for inSequence */
int compute(int(*function_1)(int, int*, Integer*), int a1, int *a2, Integer* a3){
  return function_1(a1, a2, a3);
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

/* Print an error message with the specified error number */
void print_error(int n){
  printf("Status: 500\n");
  printf("Content-Type: text/html\n");
  printf("\n");
  printf("<html><body>ERROR %d</body></html>\n",n);
}
