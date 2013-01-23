/************************************************************************
**
** Copyright (C) The MITRE Corporation 2012
**
**	Author: John D. Ramsdell (ramsdell)
**	Date: 3/19/2012
**
**	Changes:
**
**      Usage
**        $ ./lower -h
**        Usage: ./lower [options] [input]
**        Options:
**          -o file -- output to file (default is standard output)
**          -h      -- print this message
**
**	Description
**
**        The program translates ASCII uppercase letters to lowercase
**        and then prints a summary of the translations to standard
**        error.  The program is a standard Unix filter--by default it
**        takes input from standard input and writes to standard
**        output except when command-line arguments change the
**        defaults.
**
**        The program has a numeric truncation error which causes a
**        buffer underflow.  An positive integer is assigned to a
**        character creating a negative number.  To show how the bug
**        might be exploited, the program stores a secret during
**        initialization which can be extracted from the program by
**        feeding it non-ASCII characters.
**
**        To show there is a problem with non-ASCII characters, use
**        awk to generate one.
**
**          $ echo aA1 | ./lower
**          $ awk 'BEGIN {printf("\375")}' | ./lower | od -c
**
**        The secret is extracted by feeding the program with all of
**        the non-ASCII 8-bit characters in increasing order.
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
**    Spreadsheet Variant: base1
**		SOURCE_TAINT:
**		DATA_TYPE:
**		DATA_FLOW:
**		CONTROL_FLOW:
**
**    Tested in RH Linux 64bit				-
**
**    Formatted with indent --braces-on-if-line.
************************************************************************/

#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <unistd.h>

#define NCHARS 256

static const char secret[] = "this is a secret value";

static unsigned char count[NCHARS]; /* Count of translated chars */
static char keep[sizeof (secret)];  /* A store for secrets */
static char tbl[NCHARS];	/* A character translation table */

/* Print a summary of the translations. */
static int
print_summary (void)
{
  int i, j = 0;
  for (i = 0; i < NCHARS; i++) {
    if (count[i]) {		/* If char was translated */
      fprintf (stderr, "%d: %d\t", i, count[i]);
      if (++j % 8 == 0)
	fputc ('\n', stderr);
    }
  }
  if (j % 8)
    fputc ('\n', stderr);
  return 0;
}

/* Translate one character using the table. */
static int			/* Function causes an integer  */
tr (int c)			/* promotion to elimate -Wall */
{				/* warnings on char indexing */
  return tbl[c];		//STONESOUP:TRIGGER_POINT
}

static int
filter (void)
{
  int i;			/* Set up translation table */
  for (i = 0; i < NCHARS; i++) {
    count[i] = 0;
    if (isupper (i))
      tbl[i] = tolower (i);
    else
      tbl[i] = i;
  }
  memcpy (keep, secret, sizeof (secret)); /* Store secret in the keep */
  for (;;) {
    int c = getchar ();		//STONESOUP:INTERACTION_POINT
    if (c == EOF)		/* Read one character */
      return print_summary ();
    char ch = c;		//STONESOUP:CROSSOVER_POINT	
    /* FIX: unsigned char ch = c; */
    ch = tr (ch);		/* Translate */
    if (ch != c)
      count[c]++;		/* Count translations */
    putchar (ch);
  }
}

/* Generic filtering main and usage routines. */

static void
usage (const char *prog)
{
  fprintf (stderr,
	   "Usage: %s [options] [input]\n"
	   "Options:\n"
	   "  -o file -- output to file (default is standard output)\n"
	   "  -h      -- print this message\n", prog);
}

int
main (int argc, char **argv)
{
  extern char *optarg;
  extern int optind;

  char *output = NULL;

  for (;;) {
    int c = getopt (argc, argv, "o:h");
    if (c == -1)
      break;
    switch (c) {
    case 'o':
      output = optarg;
      break;
    case 'h':
      usage (argv[0]);
      return 0;
    default:
      usage (argv[0]);
      return 1;
    }
  }

  switch (argc - optind) {
  case 0:			/* Use stdin */
    break;
  case 1:
    if (!freopen (argv[optind], "r", stdin)) {
      perror (argv[optind]);
      return 1;
    }
    break;
  default:
    fprintf (stderr, "Bad arg count\n");
    usage (argv[0]);
    return 1;
  }

  if (output && !freopen (output, "w", stdout)) {
    perror (output);
    return 1;
  }

  return filter ();
}
