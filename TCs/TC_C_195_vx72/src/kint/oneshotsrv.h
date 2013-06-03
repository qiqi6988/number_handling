#ifndef _ONESHOTSVR_H
#define _ONESHOTSVR_H

/* The server calls this to generate a reply to a request.
   buf is the data received in one request.
   nchars is the number of bytes in the request.
   len is the number of bytes in the buffer.

   response_handler should place the reply in buf and return the
   number of characters in the reply.  Return a negative number on
   error. */
int response_handler(char *buf, int nchars, size_t len);

/* Logging actions for use within response handlers. */

void info(const char *fmt, ...);

void warn(const char *fmt, ...);

void fatal(const char *fmt, ...);

#endif
