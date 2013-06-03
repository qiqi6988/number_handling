// © 2011 The MITRE Corporation. ALL RIGHTS RESERVED

/*
 * register.h
 *
 *  Created on: May 11, 2011
 *      Author: RPIAZZA
 */

#ifndef MACHINE_H_
#define MACHINE_H_

//  all instructions increment the PC, except ILLEGAL, STOP and JNZ, which may if A == 0
// Op Mnemonic - Op Code - Effect
#define ILLEGAL 0		// FAULT (no instruction, or unparsable instruction)
#define LOAD 1			// A <- M(arg)
#define STORE 2			// M(arg) <- A
#define ADD 3			// A <- A + M(arg)
#define SUB 4			// A <- A - M(arg), if A > M(arg), else FAULT
#define JNZ 5			// if A != 0 then PC <- arg
#define CONS 6			// A <- arg
#define STOP 7			// terminate execute
#define DIV 8			// A <- A / M(arg)

#define MAX_PROGRAM_LENGTH 1000
#define MAX_DATA_LENGTH 1000
#define MAX_LINE_LENGTH 80
#define MAX_INSTRUCTION_MNEMONIC_LENGTH 5

#define TRUE 1
#define FALSE 0

#endif /* MACHINE_REGISTER_H_ */
