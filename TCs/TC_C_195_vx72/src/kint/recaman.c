// (c) copyright 2011 The MITRE Corporation. ALL RIGHTS RESERVED

/************************************************************************
**
** Copyright (C) The MITRE Corporation 2011
**
**  Author: Simon Ma
**  Date: 6/20/2011
**
**  Derived from: TC_C_195_base
**
**  Spreadsheet Rev #: 2
**  CWE #: 195
**  Spreadsheet Variant: vx26
**		SOURCE_TAINT: 1
**		DATA_TYPE: 1
**		DATA_FLOW: 3
**		CONTROL_FLOW: 3
**
**
**
**
**  (x means yes, - means no)
** Tested in MS Windows XP 32bit    	x
** Tested in MS Windows 7    64bit   	-
** Tested in RH Linux 32bit             -
** Tested in RH Linux 64bit             -
**
**  Revision History
**  Date      		Change
**  6/19/2011		Base program created
**
************************************************************************/

//Recaman's Sequence Generator
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include "oneshotsrv.h"

//Function prototypes
int mygeti(unsigned int *);
int recaman(unsigned int);
int inSequence(int, int *, int);

//Securely read in the input number
//Buff[7] means that a maximum of 6 digits can be read
//Any input with a 6 digits in the beginning is valid
//e.g. 123456fffff is valid but ff123456 and 1234ff6234234 are not

//STONESOUP:SOURCE_TAINT:SOCKET
int 
response_handler(char *buf, int nchars, size_t len)
{				//STONESOUP:INTERACTION_POINT
  char *end;
  const int place = 3;
  unsigned int value[5];    //STONESOUP:DATA_FLOW:ARRAY_INDEX_CONSTANT
  value[place] = (int)strtol(buf, &end, 10); //STONESOUP:CROSSOVER_POINT
  int rc = isspace(*buf) && end != buf && (*end == '\n' || *end == '\0');
  if (rc) {
    snprintf(buf, len, "Bad input\n");
    return strlen(buf);
  }

  //value is unsigned int, and provides incorrect state further into the program when negative
  //Otherwise, send the value to the recaman function if its greater than zero
  //STONESOUP:CONTROL_FLOW:CONDITIONAL
  if (value[place] >= 0) {
    snprintf(buf, len, "%d\n", recaman(value[place]));
    return strlen(buf);
  }
  snprintf(buf, len, "Error: Please enter zero or a positive integer.\n");
  return strlen(buf);
}

//Calculate the actual sequence
//A(0) = 0. a(m) = a(m-1) - 1 if a(m) is positive and not already in the sequence, otherwise a(m) = a(m-1) + m.
//The first few numbers in the Recaman's Sequence is 0, 1, 3, 6, 2, 7, 13, 20, 12, 21, 11, 22, 10, 23, 9.
int
recaman(unsigned int sequenceNo)
{
  int *sequence = NULL;
  int i;
  int currentValue;
  int outputValue = 0;

  //Create the dynamic array for storing the sequence
  sequence = (int *)calloc((sequenceNo + 1), sizeof(int)); //STONESOUP:TRIGGER_POINT  //STONESOUP:DATA_TYPE:HEAP_POINTER


  //Check to make sure the calloc call succeeded
  if (sequence == NULL) {
    printf("ERROR: Calloc memory allocation failed\n");
    return -1;
  }

  //Setup the sequence precondition
  //a(0) = 0
  sequence[0] = 0;
  for (i = 1; i <= sequenceNo; i++) {
    currentValue = (sequence[i - 1] - i);

    //Do the > 0 check:
    if (currentValue > 0) {

      //Check if the value has already been seen
      if (!inSequence(currentValue, sequence, sequenceNo)) {

	//Add it to the sequence if not
	sequence[i] = currentValue;
      }

      else {

	//Otherwise, do the addition method and add it to the sequence
	sequence[i] = (sequence[i - 1] + i);
      }
    }

    //If the value is <0 then do the addition method and add it to the sequence
    else {
      sequence[i] = (sequence[i - 1] + i);
    }
  }

  //Set the output value
  outputValue = sequence[sequenceNo];

  //Free the dynamic array
  free(sequence);
  sequence = NULL;
  return outputValue;
}

//See if the input value is already in the sequence
int
inSequence(int value, int *seq, int size)
{
  int j;
  for (j = 0; j < size; j++) {
    if (seq[j] == value) {
      return 1;
    }
  }
  return 0;
}
