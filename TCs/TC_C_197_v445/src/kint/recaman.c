/*******************************************
**
** Copyright (C) 2011 The MITRE Corporation. ALL RIGHTS RESERVED
**
** Revised December 2011, lmonk
** Author: Simon M.
** Date: 8/9/2011
**
** Base Test Program -- RecamanSequenceC
**
** STONESOUP Weakness Class: Number Handling
** CWE ID: CWE-197
** Variant Spreadsheet Rev #: 2
** Variant Spreadsheet ID: 445
**
** Variant Features:
**		SOURCE_TAINT:COMMAND_LINE
**		DATA_TYPE:STRUCT
**		DATA_FLOW:ADDRESS_ALIASING_2
**		CONTROL_FLOW:INDIRECTLY_RECURSIVE
**
*********************************************/

//Recaman's Sequence Generator
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

typedef struct v445num
{
  int value;
} v445number;

//function prototypes
int recaman(int); //not used
int inSequence(int, int *, int); //not used
int v445foo ( int x, v445number s );
int v445bar ( int x, v445number s );

// function definitions
int v445foo ( int x, v445number s )
{
  int y = s.value;
  s.value = x;
  return v445bar( y, s );
}

int v445bar ( int x, v445number s )
{
  int y = s.value;
  if ( x > 0 )
    {
      s.value = x - 1;
      y = v445foo ( x, s );
    }
  return y;
}

int main(int argc, char *argv[])
{
  int j; // loop variable
  int foobarval = 0;
  long long int llik = 0;
  int ik = 0;

  v445number input;	//STONESOUP:DATA_TYPE:STRUCT
  v445number * inputaddress;
  v445number ** inputaddressaddress;

  if ( argc != 2 )
    {
      printf("use one numerical argument\n");
      exit(1);
    }

  input.value = atoi ( argv[ 1 ] );	//STONESOUP:INTERACTION_POINT	//STONESOUP:SOURCE_TAINT:COMMAND_LINE
  inputaddress = & input;
  inputaddressaddress = & inputaddress;

  foobarval = v445foo ( input.value, **inputaddressaddress );	//STONESOUP:CONTROL_FLOW:INDIRECTLY_RECURSIVE	//STONESOUP:DATA_FLOW:ADDRESS_ALIASING_2


  for ( j = 0; j < foobarval*foobarval; j++ )
    {
      llik = 2 * ( llik + 1 );
    }

  ik = llik;//NUMERICAL_TRUNCATION

  // conditionally, sleep a while, then spin indefinitely
  if ( ik != llik )	//STONESOUP:CROSSOVER_POINT	//STONESOUP:TRIGGER_POINT
    {
      ik = ik*ik;

      while ( ik > 0 )
	{
	  ik--;
	  sleep ( 40 );
	  // this is to ensure that there will eventually be
	  // an availability DOS
	  if ( llik > 100 )
	    {
	      while ( 0 == 0 )
		{
		  ik++;
		  ik--;
		}
	    }
	}
    }

  printf("%d\n", ik);

  return 0;
}

int recaman(int sequenceNo)
{
	int *sequence = NULL;
	int outputValue = 0;

	//Create the dynamic array for storing the sequence
	sequence = (int*) calloc((sequenceNo+1),sizeof(int));

	//Check to make sure the calloc call succeeded
	if (sequence == NULL) {
		printf("ERROR: Calloc memory allocation failed\n");
		return -1;
	}

	//Setup the sequence precondition
	//a(0) = 0
	sequence[0] = 0;


	//Set the output value
	outputValue = sequence[sequenceNo];

	//Free the dynamic array
	free(sequence);
	sequence = NULL;

	return outputValue;
}

//See if the input value is already in the sequence
int inSequence(int value, int *seq, int size)
{
	int j;

	for (j=0; j < size; j++) {
		if (seq[j] == value) {
			return 1;
		}
	}

	return 0;
}
