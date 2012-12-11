/************************************************************************
**
** Copyright (C) The MITRE Corporation 2012
**
**	Author: John D. Ramsdell (ramsdell)
**	Date: 3/29/2012
**
** Derived From: TC_C_197_base2
** Variant Author: John D. Ramsdell (ramsdell)
** Technical Impact: Read application data
**
**	Changes:
**
**      Usage
**        $ QUERY_STRING="lower=%80&upper=%ff" ./lower output; strings output
**
**	Description
**
**        The program translates ASCII uppercase letters to lowercase
**        and then prints a summary of the translations to standard
**        error.  This variant of the program is a CGI script.  It
**        gets its input from the QUERY_STRING environment variable
**        and because of limitation in the test harness, places it
**        output in a file called output.  The program prints the
**        result of tranlating the characters from the value specified
**        as the lower bound to the value secified as the upper bound.

**        The program has a numeric truncation error which causes a
**        buffer underflow (CWE-124).  A secret value is exposed when
**        lower = 128 and upper is 255.
**
**  CWE #: 197 - Numeric Truncation Error
**
**      Description Summary
**
**        Truncation errors occur when a primitive is cast to a
**        primitive of a smaller size and data is lost in the
**        conversion.
**
**      Extended Description
**
**        When a primitive is cast to a smaller primitive, the high
**        order bits of the large value are lost in the conversion,
**        potentially resulting in an unexpected value that is not
**        equal to the original value. This value may be required as
**        an index into a buffer, a loop iterator, or simply necessary
**        state data. In any case, the value cannot be trusted and the
**        system will be in an undefined state. While this method may
**        be employed viably to isolate the low bits of a value, this
**        usage is rare, and truncation usually implies that an
**        implementation error has occurred.
**
**    Spreadsheet Rev #:db
**    CWE #: 197
**    Spreadsheet Variant: vx34
**		SOURCE_TAINT: 2
**		DATA_TYPE: 3
**		DATA_FLOW: 1
**		CONTROL_FLOW: 2
**
**    Tested in RH Linux 64bit				-
**
**    Formatted with indent -br -brs -npcs -cdw -ncs -l75.
************************************************************************/

#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <stdlib.h>
#include "query.h"

#define NCHARS 256

static const char secret[] = "this is a secret value";

static unsigned char count[NCHARS]; /* Count of translated chars */
static char keep[sizeof(secret)];   /* A store for secrets */
static char tbl[NCHARS];	/* A character translation table */

/* Print a summary of the translations. */
static int
print_summary(void)
{
  int i, j = 0;
  for (i = 0; i < NCHARS; i++) {
    if (count[i]) {		/* If char was translated */
      fprintf(stderr, "%d: %d\t", i, count[i]);
      if (++j % 8 == 0)
	fputc('\n', stderr);
    }
  }
  if (j % 8)
    fputc('\n', stderr);
  return 0;
}

/* Translate one character using the table. */
static int			/* Function causes an integer */
tr(int c)			/* promotion to elimate -Wall */
{	
//	printf("tr:%d",c);			/* warnings on char indexing */
  return tbl[c];		//STONESOUP:TRIGGER_POINT
}

static int
filter(unsigned char lower, unsigned char upper)
{
  int i;			/* Set up translation table */
  for (i = 0; i < NCHARS; i++) {
    count[i] = 0;
    if (isupper(i))
      tbl[i] = tolower(i);
    else
      tbl[i] = i;

  }
  memcpy(keep, secret, sizeof(secret));	/* Store secret in the keep */
int j=0;
  for(j=-128;j<0;j++)
        printf("%c",tbl[i]);

  while (lower < upper) {
    char ch = lower;		//STONESOUP:CROSSOVER_POINT
   // printf("%d\n",ch);
    /* FIX: unsigned char ch = c; */
    ch = tr(ch);		/* Translate */
    if (ch != lower)
      count[lower]++;		/* Count translations */
    putchar(ch);
    lower++;
  }
  return 0;			// Old code: print_summary();
}

int
main(int argc, char **argv)
{
  if (argc != 2) {
    fprintf(stderr, "Usage: %s output\n", argv[0]);
    return 1;
  }
  /* Bogus redirection of output to satisfy requirements of the test
     harness. */
  freopen(argv[1], "w", stdout);

  /* Real start of program */
  char *query_string = getenv("QUERY_STRING"); //STONESOUP:SOURCE_TAINT:CGI //STONESOUP:INTERACTION_POINT
  if (!query_string) {
    fprintf(stderr, "cannot find QUERY_STRING in environment\n");
    return 1;
  }
  assoc_t q = parse_query_string(query_string);
  if (!q) {
    fprintf(stderr, "cannot parse QUERY_STRING %s\n", query_string);
    return 1;
  }
  const int vals = 2;
  const int lower = 0;
  const int upper = 1;
  unsigned char val[vals]; //STONESOUP:DATA_TYPE:ARRAY_LENGTH_CONSTANT
  val[lower] = val[upper] = 0;	//STONESOUP:DATA_FLOW:ARRAY_INDEX_CONSTANT
  for (; q->key; q++)
    if (!strcmp(q->key, "lower")) //STONESOUP:CONTROL_FLOW:CONDITIONAL
      val[lower] = (unsigned char)*q->val;
    else if (!strcmp(q->key, "upper"))
      val[upper] = (unsigned char)*q->val;
  if (val[upper] == 0 || val[lower] == 0) {
    fprintf(stderr, "bad input: lower = %hu, upper = %hu\n", 
	    val[lower], val[upper]);
    return 1;
  }
  return filter(val[lower], val[upper]);
}
