/* A server that accepts one request, acts on it, replies, and then exits. */

#include <stdio.h>
#include <string.h>
#include <stdarg.h>
#include <stdlib.h>
#include <stdint.h>
#include <unistd.h>
#include <errno.h>
#ifdef _WIN32
#include <windows.h>
#include <winsock2.h>
#include <ws2tcpip.h>
#else
#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#endif
#include "oneshotsrv.h"

#define BUFFER_SIZE (1<<13)

/* Routines for reporting and logging errors */

void
info(const char *fmt, ...)
{
  va_list ap;			/* One could add a time stamp here */

  va_start(ap, fmt);
  vfprintf(stderr, fmt, ap);
  va_end(ap);
  fputc('\n', stderr);
}

static void
report(const char *fmt, va_list ap)
{
  int err = errno;
  vfprintf(stderr, fmt, ap);
  if (err != 0) {
    fputs(": ", stderr);
    perror("");
  }
  else
    fputc('\n', stderr);
}

/* Just report problem */
void
warn(const char *fmt, ...)
{
  va_list ap;

  va_start(ap, fmt);
  report(fmt, ap);
  va_end(ap);
}

/* Report problem and exit */
void
fatal(const char *fmt, ...)
{
  va_list ap;

  va_start(ap, fmt);
  report(fmt, ap);
  va_end(ap);
  exit(1);
}

static int
initserver(const char *port)
{
  struct addrinfo *ai;
  struct addrinfo hints[1];
  memset(hints, 0, sizeof(hints));
  hints->ai_flags = AI_PASSIVE;
  hints->ai_family = AF_INET;
  int ec = getaddrinfo(NULL, port, hints, &ai);
  if (ec) {
    fprintf(stderr, "Error getting bind info for port %s: %s\n",
	    port, gai_strerror(ec));
    return 1;
  }
  int fd = socket(ai->ai_family, ai->ai_socktype, ai->ai_protocol);
  if (fd < 0) 
    fatal("cannot create master socket");
  int reuse = 1;
  if (setsockopt(fd, SOL_SOCKET, SO_REUSEADDR, &reuse, sizeof(reuse)) < 0)
    fatal("cannot reuse address");
  if (bind(fd, ai->ai_addr, ai->ai_addrlen) < 0)
    fatal("cannot bind master socket");
  if (listen(fd, 10) < 0)
    fatal("cannot listen on master socket");
  freeaddrinfo(ai);
  return fd;
}

static int
start(const char *port)
{
  struct sockaddr_storage fsin[1];
  socklen_t alen = sizeof(fsin);
  int msock = initserver(port);
  char buf[BUFSIZ];
  struct timeval tv;
  tv.tv_usec = 0;
  tv.tv_sec = 12 * 60 * 60;
  if (setsockopt(msock, SOL_SOCKET, SO_RCVTIMEO, &tv, sizeof(tv)) < 0)
    fatal("cannot set timeout on accept socket");
  int fd = accept(msock, (struct sockaddr *)fsin, &alen);
  if (fd < 0)
    fatal("accept");
  close(msock);
#if defined SHOW_CLIENT
  char hbuf[NI_MAXHOST];
  int ec = getnameinfo((struct sockaddr *)fsin, alen,
		       hbuf, sizeof(hbuf), NULL, 0, 0);
  if (ec)
    warn("cannot get host name for connection: %s", gai_strerror(ec));
  else
    info("serving %s", hbuf);
#endif
  if (setsockopt(fd, SOL_SOCKET, SO_RCVTIMEO, &tv, sizeof(tv)) < 0)
    fatal("cannot set timeout on connection");
  int n = read(fd, buf, BUFSIZ);
  if (n < 0)
    fatal("read");
  if (n >= BUFSIZ)
    n = BUFSIZ - 1;
  buf[n] = '\0';
  n = response_handler(buf, n, BUFSIZ);
  if (n > BUFSIZ)
    n = BUFSIZ;
  if (n < 0)
    fatal("response handler");
  if (n > 0 && write(fd, buf, n) < 0)
    fatal("write");
  return 0;
}

static int
usage(const char *prog)
{
  fprintf(stderr,
	  "Usage: %s [-o log] port \n",
	  prog);
  return 1;
}

int
main(int argc, char *argv[])
{
  int c, errflg = 0;
  char *log = NULL;
  extern int optind;
  extern char *optarg;

  /* process program arguments */
  while ((c = getopt(argc, argv, "o:")) != -1)
    switch (c) {
    case 'o':
      log = optarg;
      break;
    default:
      errflg++;
    }
  if (errflg)
    return usage(argv[0]);

  if (argc - optind != 1)
    return usage(argv[0]);

  c = atoi(argv[optind]);
  if (c <= 0)
    fatal("bad port %d", c);

  if (!freopen(log, "w", stderr))
    fatal("cannot open log file %s", log);

  setvbuf(stderr, NULL, _IOLBF, BUFSIZ);

  return start(argv[optind]);
}
