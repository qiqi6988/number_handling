/************************************************************************
**
** Copyright (C) The MITRE Corporation 2012
**
**	Author: John D. Ramsdell (ramsdell)
**	Date: 3/23/2012
**
** Derived From: TC_C_198_base-ex1
** Variant Author: John D. Ramsdell (ramsdell)
** Technical Impact: Read application data
**
**	Description
**
**        This variant takes input as if it were a CGI application.
**
**        Normaly, this program works in two modes.  In trusted mode,
**        it reads a user name as a UTF-16 string, and if the user
**        name is "root", it enters privileged mode.  But since it's
**        connected to the socket, it never is allowed to run in this
**        mode.
**
**        In untrusted mode, it reads a user name as a UTF-16 string,
**        and if the user name is "root", it is supposed to exits with
**        an error.  Due to an incorrect assumption about byte order,
**        and adversary can feed the program a big endian user name
**        and cause the program to enter privileged mode.
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
**    Spreadsheet Variant: vx35
**		SOURCE_TAINT: 2
**		DATA_TYPE: 2
**		DATA_FLOW: 3 
**		CONTROL_FLOW: 1
**
**    Tested in RH Linux 64bit				-
**
**    Formatted with indent --braces-on-if-line.
************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <iconv.h>

/* Bogus way of checking for the word root in UTF-16 because it only
   works for little endian encodings. */
static int
is_root (short *buf)
{
  short items[] = {'r', 'o', 'o', 't', 0};
  short *item = items;
  while (*buf) //STONESOUP:CONTROL_FLOW:START_CONDITION_CONTROLLED_LOOP
    if (*buf++ != *item++) //STONESOUP:CROSSOVER_POINT
      return 0;
  return 1;
}

static int
is_byte_order_mark (short *buf)
{
  return buf[0] == (short)0xfffeu || buf[0] == (short)0xfeffu;
}

static int 
content_length()
{
  char *len = getenv("CONTENT_LENGTH");
  if (len)
    return atoi(len);
  else
    return 0;
}

static void 
show(const char *msg)
{
  size_t n = strlen(msg);
  char fmt[] =
    "Content-type: text/plain; charset=us-ascii\n"
    "Content-length: %zu\n"
    "\n%s";
  printf(fmt, n, msg);
}

static int
filter (int trusted)
{
  /* Read UTF-16 input. */
  short buf[BUFSIZ >> 1];	 //STONESOUP:DATA_TYPE:SIGNED_SHORT
  size_t len = sizeof (buf) - 2; /* Reserve space for string terminator */
  int cl = content_length();
  if (cl <= 0 || cl > len) {
    fprintf(stderr, "Bad content length %d\n", cl);
    return 1;
  }
  size_t n = fread (buf, 1, cl, stdin); //STONESOUP:INTERACTION_POINT //STONESOUP:DATA_FLOW:ARRAY_CONTENT_VALUE //STONESOUP:SOURCE_TAINT:FILE_CONTENTS
  if (n != cl && ferror (stdin)) {
    fprintf (stderr, "Error on read\n");
    return 1;
  }
  if (n & 1) {
    fprintf (stderr, "Odd number of bytes when expecting UTF-16\n");
    return 1;
  }
  n = n >> 1;			/* Convert to number of characters */
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
  if (buf[0] == (short)0xfffeu)
    cd = iconv_open ("UTF-8", "UTF-16BE");
  else if (buf[0] == (short)0xfeffu)
    cd = iconv_open ("UTF-8", "UTF-16LE");
  else
    cd = iconv_open ("UTF-8", "UTF-16");
  if (cd == (iconv_t) - 1) {
    perror ("iconv_open");
    return 1;
  }
  char *inbuf = (char *) (bom ? buf + 1 : buf);
  size_t inbytes = n << 1;
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

  /* Make security decision based on user name. */
  if (strcmp (username, "root")) //STONESOUP:TRIGGER_POINT
    show ("Restricted operations permitted\n");
  else
    show ("Privileged operations permitted\n");
  return 0;
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
  int trusted = 0;		/* This app is never trusted */

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

  return filter (trusted);
}
