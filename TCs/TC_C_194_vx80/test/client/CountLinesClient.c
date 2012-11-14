/***********************************************************************
**
** Copyright (C) The MITRE Corporation 2011
**
**  Author: Conor Harris
**  Date: 03 Apr 12
**
**  Revision History
**  Date      Change
**  03 Apr 12 Initial Creation by Conor Harris
**
**  Based on NewsClient.c to the NewsServer.c in TC_C_824_base-ex1
**
**  This is a simple client program that parses cmd line input and writes
**  to a shared memory segment
**
**  The server will write back a response depending on what the client sends
**
**  The processes synchronize via the creation / deletion of a file
**  NOTE: this is not true synchronization and is used to get timings
**  reasonable for the testing harness
**
**  There should not be any errors in this program, it is simply a utility
**  to allow input to be delivered over shmem. Please let me know if
**  you find any issues.
**
**  The server is only vulnerable when run in certain modes, so the input
**  below is laid out as SERVER INPUT || CLIENT INPUT
**
**  NOTE: The errors will be seen in the server given these client inputs
**
**  TC_C_824_base-ex1
**  Good1 : ./BadServer admin 9876  || ./client 9876 0
**  Good2 :  (still running )       || ./client 9876 3
**  Good3 :  (still running )       || ./client 9876 4
**  Good4 : ./BadServer client 9876 || ./client 9876 2
**  Bad 1 :  (still running )       || ./client 9876 3
************************************************************************/

/******** INCLUDES ********/
#include <stdio.h>                   /* ...IO routines                       */
#include <stdlib.h>                  /* exit, etc.                           */
#include <string.h>                  /* str functions                        */
#include <strings.h>                 /* bzero                                */
#include <unistd.h>                  /* write, close                         */
#ifdef _WIN32
#include <windef.h>
#include <WinBase.h>
#include <Windows.h>
#include <winsock2.h>
#include <ws2tcpip.h>
#else
#define __USE_XOPEN		     /* Need this for the shm.h include      */
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#endif

/********* DEFINES ********/
#define MAX_KEY      (9999)          /* arbitrary cutoff for max port num    */
#define MIN_KEY      (5000)          /* stay clear of low port nums          */
#define MAX_MSG      (256)           /* limit messages to 256 chars          */
#define ERROR        (-1)            /* ERROR return code for lcm func       */
#define MAX_RETRY    (3)             /* number of times to try server        */
#define QUIT         (4)             /* quit command                         */

/* Concatenate cmd line input, open socket to server, write data. */
int main(int argc, char *argv[])
{
  int   shmem_id;                    /* id for shared mem allocation         */
  key_t key;                         /* key for allocating shmem             */
  char *shm;                         /* pointer to shmem                     */
  FILE *lockfile;                    /* fh for lockfile                      */
  int   retries;                     /* num times to retry file removal      */

  if( 4 != argc )
    {
      printf("Error, usage: <key> <filename> <max line len>\n");
      exit(1);
    }

  /* validate filename is not too long */
  if( (MAX_MSG-1) <= strlen(argv[2]) )
    {
      printf("ERROR: command is too long, limit is %d\n", MAX_MSG-1);
      exit(1);
    }

  /* pull key out of input */
  key = (int)strtol(argv[1], (char **)NULL, 10);

  /* Make sure key is between 5k and 10k */
  if( MAX_KEY < key || MIN_KEY > key )
    {
      printf("Please provide a key between %d and %d\n", MIN_KEY, MAX_KEY);
      exit(1);
    }

  /* get id and attach to shmem */
  retries = MAX_RETRY;
  while( 0 > (shmem_id = shmget( key, MAX_MSG, 0666 )) )
    {
      sleep(2);

      if( 0 == retries )
        {
          printf("Error getting shmem id, exiting...\n");
          exit(1);
        }

      retries--;
    }

  if( ((char*)(-1)) == (shm = shmat( shmem_id, NULL, 0 )) )
    {
      printf("Error attaching to shmem, exiting...\n");
      exit(1);
    }


  /* zero message and fill with command */
  bzero( shm, MAX_MSG );
  snprintf( shm, MAX_MSG, "%s %s", argv[2], argv[3] );
  shm[MAX_MSG-1] = '\0';

  /* Tell server we've sent a command by creating lockfile */
  if( NULL == (lockfile = fopen("lockfile", "w+")) )
    {
      printf("Error creating lockfile in client, exiting\n");
      shmdt( shm );
      exit(1);
    }
  fclose( lockfile );

  while(access("lockfile", F_OK) == 0)
    {
      /* able to open file, therefore it exists. close and sleep(2) */
  		sleep(1);
    }

  /* insert NUL byte */
  shm[MAX_MSG-1] = '\0';
  char fname[MAX_MSG + 12];
  strcpy(fname, argv[2]);
  strcpy(fname + strlen(fname) - 5, "Out.bin");
  fprintf(stderr, "Output being written to '%s'.\n", fname);
  FILE *fp;
  if ((fp = fopen(fname, "wb")) != NULL)
  {
    fprintf(fp, "Server response is %s.\n", shm);
    fclose(fp);
  }
  printf("Server response is %s.\n", shm);
  shm[0] = 0;	/* Flag Test Case it is done */

  shmdt( shm );
  shmctl( shmem_id, IPC_RMID, 0 );

  return (0);
}

/* End of file */
