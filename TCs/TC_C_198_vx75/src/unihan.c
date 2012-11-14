/************************************************************************
**
** Copyright (C) The MITRE Corporation 2012
**
**	Author: John D. Ramsdell (ramsdell)
**	Date: 4/3/2012
**
** Derived From: TC_C_198_base-ex1
** Variant Author: John D. Ramsdell (ramsdell)
** Technical Impact: Read application data
**
**	Description
**
**        This variant takes input from a socket.
**
**        Normaly, this program works in two modes.  In trusted mode,
**        it reads a user name as a UTF-32 string, and if the user
**        name is "root", it enters privileged mode.  But since it's
**        connected to the socket, it never is allowed to run in this
**        mode.
**
**        In untrusted mode, it reads a user name as a UTF-32 string,
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
**    Spreadsheet Variant: base1
**		SOURCE_TAINT: 3
**		DATA_TYPE: 1
**		DATA_FLOW: 1
**		CONTROL_FLOW: 3
**
**    Tested in RH Linux 64bit				-
**
**    Formatted with indent --braces-on-if-line.
************************************************************************/

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <iconv.h>
#include "oneshotsrv.h"

/* Bogus way of checking for the word root in UTF-32 because it only
   works for little endian encodings. */
static int
is_root (wchar_t *buf)
{			    //STONESOUP:DATA_FLOW:ARRAY_INDEX_CONSTANT
  return buf[0] == 'r'		//STONESOUP:CROSSOVER_POINT
    && buf[1] == 'o'
    && buf[2] == 'o'
    && buf[3] == 't';
}

static int
is_byte_order_mark (wchar_t *buf)
{
  return buf[0] == 0xfffe0000u || buf[0] == 0x0000feffu;
}

int
response_handler(char *buf, int n, size_t len)
{				//STONESOUP:SOURCE_TAINT:SOCKET
  int trusted = 0;		/* No trust in web access mode */
  wchar_t *wbuf = (wchar_t *)buf; //STONESOUP:DATA_TYPE:WIDE_CHARACTER
  if (n & 3) {
    snprintf (buf, len, "Odd number of bytes when expecting UTF-32\n");
    return strlen(buf);
  }
  n = n >> 2;			/* Convert to number of characters */
  wbuf[n] = 0;

  int bom = is_byte_order_mark (wbuf);

  if (!trusted) {
    /* Make sure string is not root */
    if (n == 4 && is_root (wbuf)) {
      snprintf (buf, len, "Root is a reserved user name\n");
      return strlen(buf);
    }
    if (n == 5 && bom && is_root (wbuf + 1)) {
      snprintf (buf, len, "Root is a reserved user name\n");
      return strlen(buf);
    }
  }

  //STONESOUP:CONTROL_FLOW:SEQUENCE
  /* Get user name as UTF-8 */

  iconv_t cd;
  if (wbuf[0] == 0xfffe0000u)
    cd = iconv_open ("UTF-8", "UTF-32BE");
  else if (wbuf[0] == 0x0000feffu)
    cd = iconv_open ("UTF-8", "UTF-32LE");
  else
    cd = iconv_open ("UTF-8", "UTF-32");
  if (cd == (iconv_t) - 1) {
    perror ("iconv_open");
    return -1;
  }
  char *inbuf = (char *) (bom ? wbuf + 1 : wbuf);
  size_t inbytes = n << 2;
  char username[BUFSIZ];
  char *outbuf = username;
  size_t outbytes = sizeof (username);
  size_t bytes = iconv (cd, &inbuf, &inbytes, &outbuf, &outbytes);
  if (bytes == (size_t) - 1) {
    perror ("iconv");
    return -1;
  }
  if (inbytes != 0) {
    fprintf (stderr, "User name not UTF-32\n");
    return -1;
  }

  /* Make security decision based on user name. */
  if (strcmp (username, "root")) //STONESOUP:TRIGGER_POINT
    snprintf (buf, len, "Restricted operations permitted\n");
  else
    snprintf (buf, len, "Privileged operations permitted\n");
  return strlen(buf);
}
