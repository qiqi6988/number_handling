/*******************************************
**
** Copyright (C) 2011 The MITRE Corporation. ALL RIGHTS RESERVED
**
** Revised December. 2011, lmonk
** Author: Evan G. Tobac
** Date: 7/26/2011
**
** Base Test Program -- RegisterMachineC
**
** Implements a register machine emulator.  Executes assembly instructions
** such as ADD, SUB, and STORE based on a provided program file.  The machine
** has an accumulator, A which keeps track of the result.
**
** Division is now implemented by searching for an approximate
** divisor, so division by zero of a non-zero number results in an
** infinite loop. (lmonk)
**
** Variant Test Case Program
**
** STONESOUP Weakness Class: Number Handling
** CWE ID: CWE-369
** Variant Spreadsheet Rev #: 2
** Variant Spreadsheet ID: 491
**
** Variant Features:
**		SOURCE_TAINT:COMMAND_LINE
**		DATA_TYPE:STRUCT
**		DATA_FLOW:ARRAY_INDEX_LINEAR_EXPRESSION
**		CONTROL_FLOW:START_CONDITION_CONTROLLED_LOOP
**
*********************************************/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>
#include <ctype.h>
#include "machine.h"

int signum ( int x );

int programMemory[MAX_PROGRAM_LENGTH][2];
int dataMemory[MAX_DATA_LENGTH];
int PC = 0;
int A = 0;
int B = 0;
int sigA = 1;
int sigB = 1;
int C = 0;

int signum ( int x )
{
  int y = 1;
  if ( x < 0 ) { y = -1; }
  return y;
}

int execute() {
  PC = 0;
  while (PC <= MAX_PROGRAM_LENGTH)	//STONESOUP:CONTROL_FLOW:START_CONDITION_CONTROLLED_LOOP
    {
      //printf("Executing %d at %d - ", programMemory[PC][0], PC);
      switch (programMemory[PC][0]) {
      case LOAD:
	A = dataMemory[programMemory[PC][1]];
	PC++;
	break;
      case STORE:
	dataMemory[programMemory[PC][1]] = A;
	PC++;
	break;
      case ADD:
	A += dataMemory[programMemory[PC][1]];
	PC++;
	break;
      case SUB:
	if (A < dataMemory[programMemory[PC][1]]) {
	  return FALSE;
	}
	A -= dataMemory[programMemory[PC][1]];
	PC++;
	break;
      case JNZ:
	if (A != 0) {
	  PC = programMemory[PC][1];
	} else {
	  PC++;
	}
	break;
      case CONS:
	A = programMemory[PC][1];
	PC++;
	break;
      case STOP:
	printf("%d\n", A);
	return TRUE;
      case DIV:
	B = dataMemory[programMemory[PC][1]];
	sigA = signum( A );
	sigB = signum( B );
	A = sigA * A;
	B = sigB * B;
	printf("%d%d",A,B);exit(1);
	C = 0;
	while ( A != B*C )	//STONESOUP:CROSSOVER_POINT	//STONESOUP:TRIGGER_POINT
	  {
//	printf("ok");
	    C++;
	  }
	A = C * sigA * sigB;
	PC++;
	break;
      default:
	return FALSE;
      }
    }
  return FALSE;
}

int getInstruction(const char* inst) {
  // Any mnemonic greater than size MAX_INSTRUCTION_MNEMONIC_LENGTH yields the ILLEGAL instruction
  // Anything not one of the seven known mnemonics, also yields the ILLEGAL instruction.
  if (strlen(inst) > MAX_INSTRUCTION_MNEMONIC_LENGTH) {
    return ILLEGAL;
  }
  else if (strcmp(inst, "LOAD") == 0) {
    return LOAD;
  }
  else if (strcmp(inst, "STORE") == 0) {
    return STORE;
  }
  else if (strcmp(inst, "ADD") == 0) {
    return ADD;
  }
  else if (strcmp(inst, "SUB") == 0) {
    return SUB;
  }
  else if (strcmp(inst, "JNZ") == 0) {
    return JNZ;
  }
  else if (strcmp(inst, "CONS") == 0) {
    return CONS;
  }
  else if (strcmp(inst, "STOP") == 0) {
    return STOP;
  }
  else if (strcmp(inst, "DIV") == 0) {
    return DIV;
  }
  else {
    return ILLEGAL;
  }
}

int allDigits(const char *s) {
  // true if string s contains only digits, false otherwise
  int i;
  int slen = strlen(s);
  for (i = 0; i < slen; i++) {
    if (!isdigit(s[i])) {
      return FALSE;
    }
  }
  return TRUE;
}

int getArgument(const char* arg) {
  // make sure the argument can fit in a 32-bit integer
  if (strlen(arg) > 0 && allDigits(arg)) {
    double argValue = atof(arg);
    if (argValue <= (double) INT_MAX) {
      return atoi(arg);
    }
  }
  return -1;
}

int indexOf(const char* s, char c, int sLengthEstimate, int errorExit) {
  // utility method to find char c in string s
  int index = 0;
  while (*(s+index) != '\0') {
    if (*(s+index) == c) {
      return index;
    }
    sLengthEstimate--;
    if (sLengthEstimate == 0) {
      printf("Estimated string length exceeded before finding %c", c);
      exit(-1);
    }
    index++;
  }
  if (errorExit) {
    printf("%c not found in %s\n", c, s);
    exit(-1);
  } else {
    return -1;
  }
}

void dump(int numLocations) {
  //printf("\nMemory dump:\n\n");

  int i;
  for (i = 0; i < numLocations; i++) {
    if (i > MAX_DATA_LENGTH-1) {
      printf("No more memory\n");
      return;
    }
    //printf("%d. %d\n", i, dataMemory[i]);
  }

}

int main(int argc, char** argv) {

  //filename.fn[x + 1] = getenv("INPUTFILE");
  if ( argc != 2) { printf("give progam file name argument\n"); exit(1); }	//STONESOUP:SOURCE_TAINT:COMMAND_LINE	//STONESOUP:INTERACTION_POINT	//STONESOUP:DATA_TYPE:STRUCT	//STONESOUP:DATA_FLOW:ARRAY_INDEX_LINEAR_EXPRESSION
  char * progname = argv[1];
  FILE *programf = fopen(progname,"r");
  if (programf == NULL) {
    printf("No program file\n");
    exit(-1);
  }
  char line[80];
  char inst[80];
  char inst_arg[80];
  int i = 0;
  // "assemble" the program...
  while (fgets(line, MAX_LINE_LENGTH, programf) != NULL) {
    // make it unix friendly
    int placeForNull = indexOf(line, '\r', MAX_LINE_LENGTH, 0);
    if (placeForNull == -1) {
      placeForNull = indexOf(line, '\n', MAX_LINE_LENGTH, 0);
    }
    if (placeForNull == -1) {
      placeForNull = MAX_LINE_LENGTH-1;
    }
    line[placeForNull] = '\0';
    //printf("%d. %s\n", i, line);
    int itemsRead = sscanf(line, "%s %s", inst, inst_arg);
    if (itemsRead > 0) {
      programMemory[i][0] = getInstruction(inst);
    }
    if (itemsRead == 1) {
      if (programMemory[i][0] != STOP) {
	printf("Bad instruction\n");
	fclose(programf);
	exit(-1);
      }
    } else {
      programMemory[i][1] = getArgument(inst_arg);
    }
    if (programMemory[i][1] == -1) {
      printf("Bad instruction\n");
      fclose(programf);
      exit(-1);
    }
    i++;
  }
  fclose(programf);
  // execute the program
  execute();
  return 0;
}
