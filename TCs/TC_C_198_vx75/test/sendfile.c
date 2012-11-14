/* A simple client for the one shot server

   John D. Ramsdell -- April 3, 2012

   The client sends a message in file to a server and prints the reply.

   Usage: ./sendfile [options] port file
   Options:
     -n host   server host name (default localhost)
*/

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#ifdef _WIN32
#include <windows.h>
#include <winsock2.h>
#include <ws2tcpip.h>
#else
#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#endif

#define RETRIES 10
#define SLEEP 10

static int
start(const char *host, const char *port, const char *mesg, size_t nmesg, char *fn)
{
	int i;
  struct addrinfo *ai;
  struct addrinfo hints[1];
  memset(hints, 0, sizeof(hints));
  hints->ai_family = AF_INET;
  int ec = getaddrinfo(host, port, hints, &ai);
  if (ec) {
    fprintf(stderr, "Error getting host info for %s:%s: %s\n",
	    host, port, gai_strerror(ec));
    return 1;
  }
  int fd = socket(ai->ai_family, ai->ai_socktype, ai->ai_protocol);
  if (fd < 0) {
    perror("creating socket");
    return 1;
  }
  for (i = 0; connect(fd, ai->ai_addr, ai->ai_addrlen) < 0; i++) {
      if (i >= RETRIES) {
	perror("connecting to server");
	return 1;
      }
      sleep(SLEEP);
  }
  if (write(fd, mesg, nmesg) < 0) {
    perror("writing request");
    return 1;
  }
  char buf[BUFSIZ];
  ssize_t n = read(fd, buf, BUFSIZ - 1);
  if (n < 0) {
    perror("reading reply");
    return 1;
  }
  buf[n] = '\0';
  if (fn)
  {
  	char fname[200];
  	strcpy(fname, fn);
  	strcpy(fname + strlen(fname) - 4, "Out.bin");
  	FILE *fp;
  	if ((fp = fopen(fname, "wb")) != NULL)
  	{
  	  fprintf(fp, "%s\n", buf);
  		fclose(fp);
  	}
  }
  printf("%s\n", buf);
  return 0;
}

static int
usage(const char *prog)
{
  fprintf(stderr,
	  "Send a message in a file to a server and print the reply\n"
	  "Usage: %s [options] port [file]\n"
	  "Options:\n"
	  "  -n host   server host name (default localhost)\n",
	  prog);
  return 1;
}

int
main(int argc, char *argv[])
{
  int c, errflg = 0;
  char *host = "localhost";
  char buf[BUFSIZ];
  char *fn = NULL;
  extern int optind;
  extern char *optarg;

  /* process program arguments */
  while ((c = getopt(argc, argv, "n:")) != -1)
    switch (c) {
    case 'n':
      host = optarg;
      break;
    default:
      errflg++;
    }
  if (errflg)
    return usage(argv[0]);

  switch (argc - optind) {
  case 1:			/* Input from standard input */
    break;
  case 2:			/* Input from file */
  	fn = argv[optind + 1];
    if (!freopen (argv[optind + 1], "r", stdin)) {
      perror (argv[optind + 1]);
      return 1;
    }
    break;
  default:
    return usage(argv[0]);
  }

  size_t n = fread(buf, 1, sizeof(buf), stdin);
  if (n != sizeof(buf) - 1 && ferror (stdin)) {
    fprintf (stderr, "Error on read\n");
    return 1;
  }

  return start(host, argv[optind], buf, n, fn);
}
