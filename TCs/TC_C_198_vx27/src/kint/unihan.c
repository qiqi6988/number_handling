/************************************************************************
**
** Copyright (C) The MITRE Corporation 2012
**
**	Author: John D. Ramsdell (ramsdell)
**	Date: 3/23/2012
**
**      Variant Author: John D. Ramsdell (ramsdell)
**      Derived From: new BTC for 198 
**      Technical Impact: bypass security
** 
**	Changes:
**
**      Usage
**        $ ./unihan -h
**        Usage: ./unihan [options] [input]
**        Options:
**          -o file -- output to file (default is standard output)
**          -t      -- run in trusted mode accepting root as input
**          -h      -- print this message
**
**	Description
**
**        This program works in two modes.  In trusted mode (invoked
**        with the -t option), it reads a user name as a UTF-16
**        string, and if the user name is "root", it enters privileged
**        mode.
**
**        In untrusted mode (invoked without the -t option), it reads
**        a user name as a UTF-16 string, and if the user name is
**        "root", it is supposed to exits with an error.  Due to an
**        incorrect assumption about byte order, and adversary can
**        feed the program a big endian user name and cause the
**        program to enter privileged mode.
**
**        The bad case occurs when the program is run in untrusted
**        mode and receives a UTF-16BE version of the string root.
**
**          $ echo -n root | iconv -f UTF-8 -t UTF-16BE \
**                | awk '{printf("\376\377%s",$0)}' | ./unihan
**          Privileged operations permitted
**
**        The program is called unihan because when you interpret the
**        string root encoded as UTF-16BE as UTF16LE, the four
**        characters are in the Unified Han part of the Unicode
**        standard.
**
**  CWE #: 198 - Use of Incorrect Byte Ordering
**
**      Description Summary
**
**       The software receives input from an upstream component, but
**       it does not account for byte ordering (e.g. big-endian and
**       little-endian) when processing the input, causing an
**       incorrect number or value to be used.
**
**    Spreadsheet Rev #:db
**    CWE #: 198
**    Spreadsheet Variant: base1
**		SOURCE_TAINT: 1
**		DATA_TYPE: 3
**		DATA_FLOW: 2
**		CONTROL_FLOW: 2
**
**    Tested in RH Linux 64bit				-
**
**    Formatted with indent --braces-on-if-line.
************************************************************************/

#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <iconv.h>

/* Bogus way of checking for the word root in UTF-16 because it only
   works for little endian encodings. */
static int
is_root (unsigned short *buf)
{
  return buf[0] == 'r'		//STONESOUP:CROSSOVER_POINT
    && buf[1] == 'o'
    && buf[2] == 'o'
    && buf[3] == 't';
}

static int
is_byte_order_mark (unsigned short *buf)
{
  return buf[0] == 0xfffeu || buf[0] == 0xfeffu;
}

static int
decide(char *username)
{
  /* Make security decision based on user name. */
  if (strcmp (username, "root")) //STONESOUP:TRIGGER_POINT
    printf ("Restricted operations permitted\n");
  else
    printf ("Privileged operations permitted\n");
  return 0;
}

static int
filter (int trusted)
{
  /* Read UTF-16 input. */
  unsigned short buf[BUFSIZ];
  size_t len = sizeof (buf) - 1; /* Reserve space for string terminator */
  //STONESOUP:SOURCE_TAINT:FILE_CONTENTS
  //STONESOUP:INTERACTION_POINT
  size_t n = fread (buf, sizeof(unsigned short), len, stdin);
  if (n != len && ferror (stdin)) {
    fprintf (stderr, "Error on read\n");
    return 1;
  }
  buf[n] = 0;

  int bom = is_byte_order_mark (buf);

  if (!trusted) {
    /* Make sure string is not root */
    if (n == 4 && is_root (buf)) {
      fprintf (stderr, "Root is a reserved user name\n");
      return 1;
    }
    if (n == 5 && bom && is_root (buf + 1)) {
      fprintf (stderr, "Root is a reserved user name\n");
      return 1;
    }
  }

  /* Get user name as UTF-8 */

  iconv_t cd;
  switch (buf[0]) {
  case 0xfffeu:
    cd = iconv_open ("UTF-8", "UTF-16BE");
    break;
  case 0xfeffu:
    cd = iconv_open ("UTF-8", "UTF-16LE");
    break;
  default:
    cd = iconv_open ("UTF-8", "UTF-16");
  }
  if (cd == (iconv_t) - 1) {
    perror ("iconv_open");
    return 1;
  }
  //STONESOUP:DATA_TYPE:SIGNED_BYTE
  //STONESOUP:DATA_FLOW:ADDRESS_ALIASING_1
  char *inbuf = (char *) (bom ? buf + 1 : buf);
  size_t inbytes = n * sizeof(unsigned short);
  char username[BUFSIZ];
  char *outbuf = username;
  size_t outbytes = sizeof (username);
  size_t bytes = iconv (cd, &inbuf, &inbytes, &outbuf, &outbytes);
  if (bytes == (size_t) - 1) {
    perror ("iconv");
    return 1;
  }
  if (inbytes != 0) {
    fprintf (stderr, "User name not UTF-16\n");
    return 1;
  }

  //STONESOUP:CONTROL_FLOW:INTERPROCEDURAL
  return decide(username);
}

/* Generic filtering main and usage routines. */

static void
usage (const char *prog)
{
  fprintf (stderr,
	   "Usage: %s [options] [input]\n"
	   "Options:\n"
	   "  -o file -- output to file (default is standard output)\n"
	   "  -t      -- run in trusted mode accepting root as input\n"
	   "  -h      -- print this message\n", prog);
}

int
main (int argc, char **argv)
{
  extern char *optarg;
  extern int optind;

  char *output = NULL;
  int trusted = 0;

  for (;;) {
    int c = getopt (argc, argv, "o:ht");
    if (c == -1)
      break;
    switch (c) {
    case 'o':
      output = optarg;
      break;
    case 't':
      trusted = 1;
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

  return filter (trusted);
}
