#ifndef _ISTRLEN_H
#define _ISTRLEN_H


/* Error return values */
#define ESTRINGEMPTY -1
#define EOUTOFRANGE -2
#define ENOTASCII	-4

/*
   Get length of a string. Returns either the length of a string, or -1 if not a string
*/

short istrlen(const char * str);

#endif  // _PRINTORDER_H
