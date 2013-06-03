/***********************************************************************

**

** Copyright (C) The MITRE Corporation 2012

**

**  Author: Danny Haynes

**  Date: 24 March 12

**

**  Revision History

**  Date      Change

**  24 March 12 Initial Creation by Danny Haynes

**

**

** This program is the server end of the application that computes the slope and

** y-intercept of the line formed by the two points (x1, y1) and (x2, y2). The

** equation takes the form y = mx + b. This program contains CWE-369 (divide-by-zero)

** when it computes the slope of a line (m = (y2 - y1)/(x2 - x1)) where the slope is

** undefined. That is, the line has an undefined slope when (x2 - x1) = 0.


**

** Error: The attempt to divide by zero occurs in compute_slope() when div(), from stdlib.h,

** is used to determine whether or not we need to use floating point precision when computing

** the slope of the line because x does not evenly divide into y. The divide by zero error

** occurs when the the change in x between the two points is 0 meaning that the slope is undefined.

** 

**

** STONESOUP Weakness Class: Number Handling

** CWE ID: CWE-369

** Variant Spreadsheet Rev #:

** Variant Spreadsheet ID: TC_C_369_vx23

** Derived From: TC_C_369_base2

** Variant Features: SOURCE_TAINT:ENVIRONMENT_VARIABLE

**                   DATA_TYPE:VOID_POINTER                   

**                   DATA_FLOW:ADDRESS_ALIASING_2

**                   CONTROL_FLOW:INTERCLASS

** Variant Author: Danny Haynes

** Technical Impact: DoS (uncontrolled exit/crash)

** I/0 Pairs (should be passed to the client):

**   Good: 1st Set:1 -2 3 4

**         2nd Set:42 2 -23 2

**         3rd Set:-12 -322 -252 -94

**         4th Set:

**         5th Set:

**    Bad: 1st Set:2 5 2 8

**         2nd Set:

**

**

** How program works:

**     The program is run with ./tc_c_369_server

**     This program listens for connections on 127.0.0.1:7890.

**

************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <errno.h>
#include <string.h>
#include <strings.h>
#include <unistd.h>
#include "query.h"

#define BUFFER_SIZE 1024

/* This struct represents a point on a coordinate plane (x, y). */
typedef struct point{
  int x;
  int y;
}point;

/* This tells us what type of data we found and parsed from the command line.  */
enum INPUT {INPUT_POINTS, /* Found and parsed x1 y1 x2 y2 */
            INPUT_QUIT,   /* Found the quit command, let's shut down the server */
            INPUT_ERROR}; /* There was an error while parsing the data, let's quit */

/* This enumeration lets us indicate whether or not the slope is defined or not. */
enum SLOPE {DEFINED_SLOPE, /* dy/dx is some number; y = mx + b */
	    UNDEFINED_SLOPE /* dy/dx = undefined (dx = 0); x = n where n is some integer */
};

/* This structure contains the "interclass" function that will be called to compute the slope
   of a line given two points. 
*/
typedef struct function{
  enum SLOPE(*compute)(void** p1, void** p2, float* m);
}function;

/* This function parses the data and if successful will let us know if we have to quit
   or if we have our valid points.
*/
enum INPUT parse_input(char*,point*,point*);

/* This function computes the slope of the line given two points. */
enum SLOPE compute_slope(void**,void**,float*);

/* This function computes the y-intercept of the line given the slope and a point
   on the line.
*/
float compute_y_intercept(float,point);

/* This function computes the difference between two integer values. */
int compute_difference(int,int);

/* This function compares two strings based on length and whether or not all of the
   characters match for the entire length of the strings.
*/
int is_match(char* str1,char* str2);

int main(int argc, char* argv[]){

  int sockfd;
  /*printf("\nSERVER: starting the server\n");*/
  
  /* Create a socket */
  /*printf("SERVER: creating socket\n");*/
  if ((sockfd = socket(AF_INET, SOCK_STREAM, 0)) == -1){
    /*perror("SERVER: socket() failed");*/
    printf("1 SERVER ERROR\n");
    exit(EXIT_FAILURE);
  }

  int opt = 1;
  /* Make it so we can reuse the address and don't get the annoying "address already in use" error message */
  if (setsockopt(sockfd, SOL_SOCKET, SO_REUSEADDR, &opt, sizeof(opt)) < 0){
    printf("2 SERVER ERROR\n");
    exit(EXIT_FAILURE);
  }
  
  /* Configure connection settings */
  struct sockaddr_in addr;
  char ipaddr[] = "127.0.0.1";
  addr.sin_family = AF_INET;
  addr.sin_port = htons(7890);
  /*printf("SERVER: configuring the server to listen on %s:%d\n",ipaddr,ntohs(addr.sin_port));*/
  if (inet_pton(AF_INET, ipaddr, &addr.sin_addr.s_addr) < 1){
    /*perror("inet_pton() failed");*/
    if (close(sockfd) == -1){
      /*perror("SERVER: close(server socket) failed");*/
    }
    printf("3 SERVER ERROR\n");
    exit(EXIT_FAILURE);
  }
  
  /* Bind the socket to an address */
  /*printf("SERVER: binding the server to %s:%d\n",ipaddr,ntohs(addr.sin_port));*/
  if (bind(sockfd,(struct sockaddr*)&addr,sizeof(addr)) == -1){
    /*perror("SERVER: bind() failed");*/  
    if (close(sockfd) == -1){
      /*perror("SERVER: close(server socket) failed");*/
    }
    printf("4 SERVER ERROR\n");
    exit(EXIT_FAILURE);
  }
  
  /* Listen for incoming connections */
  /*printf("SERVER: listening for an incoming connection\n");*/
  if (listen(sockfd,SOMAXCONN) == -1){
    /*perror("SERVER: listen() failed");*/
    if (close(sockfd) == -1){
      /*perror("SERVER: close(server socket) failed");*/
    }
    printf("5 SERVER ERROR\n");
    exit(EXIT_FAILURE);
  }
  
  int clisock;
  struct sockaddr_in cliaddr;
  socklen_t clilength = sizeof(cliaddr);
  
  /* Handle incoming connections */
  while(1){
    /*printf("SERVER: waiting for a connection from a client\n");*/ 
    if ((clisock = accept(sockfd,(struct sockaddr*)&cliaddr,&clilength)) == -1){
      /*perror("SERVER: accept() failed");*/
      if (close(sockfd) == -1){
	/*perror("SERVER: close(server socket) failed");*/
      }
      printf("6 SERVER ERROR\n");
      exit(EXIT_FAILURE);
    }

    /* Get information about the connecting client */
    char addrbuf[INET_ADDRSTRLEN]; 
    /*printf("SERVER: getting connection information about the client\n");*/
    if (inet_ntop(AF_INET,&((&cliaddr)->sin_addr),addrbuf,INET_ADDRSTRLEN) == NULL){
      /*perror("SERVER: inet_ntop() failed");*/
      if (close(clisock) == -1){
	/*perror("SERVER: close(client socket) failed");*/
      }
      if (close(sockfd) == -1){
	/*perror("SERVER: close(server socket) failed");*/
      }
      printf("7 SERVER ERROR\n");
      exit(EXIT_FAILURE);
    }

    /*printf("SERVER: accepted a connection from the client %s:%d\n",addrbuf,ntohs(cliaddr.sin_port));*/

    /* Read coordinate data x1 y1 x2 y2 from the client */
    char buffer[BUFFER_SIZE];
    bzero(buffer,BUFFER_SIZE);
    
    /*printf("SERVER: reading data from the client\n");*/
    if (read(clisock,buffer,BUFFER_SIZE) == -1){ 
      /*perror("SERVER: read failed()");*/
      if (close(clisock) == -1){
	/*perror("SERVER: close(client socket) failed");*/
      }
      if (close(sockfd) == -1){
        /*perror("SERVER: close(server socket) failed");*/
      }
      printf("8 SERVER ERROR\n");
      exit(EXIT_FAILURE);
    }

    /*
    printf("SERVER: read %s from client\n",buffer);    
    printf("SERVER: parsing the data from the client\n");
    */

    enum INPUT input;
    point p1,p2;
	printf("%s\n",buffer);
    if ((input = parse_input(buffer,&p1,&p2)) != INPUT_POINTS){
      if (close(clisock) == -1){
        /*perror("SERVER: close(client socket) failed");*/
      }
      if (close(sockfd) == -1){
        /*perror("SERVER: close(server socket) failed");*/
      }
      
      if (input == INPUT_ERROR){
	printf("9 SERVER ERROR\n");
       	exit(EXIT_FAILURE);
      }else{
	/*printf("SERVER: closing the server\n");*/
	exit(EXIT_SUCCESS);
      }
    }

    point* ap1 = &p1;
    point* ap2 = &p2;

    point** aap1 = &ap1; // STONESOUP:DATA_FLOW:ADDRESS_ALIASING_2
    point** aap2 = &ap2;

    void** vp1 = (void**)aap1; // STONESOUP:DATA_TYPE:VOID_POINTER
    void** vp2 = (void**)aap2;

    /*printf("SERVER: found points (%d,%d) and (%d,%d)\n",p1.x,p1.y,p2.x,p2.y);*/
    
    /* Compute the slope of the line formed by the two given points */
    /*printf("SERVER: computing the slope for (%d,%d) and (%d,%d))\n",p1.x,p1.y,p2.x,p2.y);*/
    
    float m;
    struct function f;
    f.compute = compute_slope;
    enum SLOPE slope = f.compute(vp1,vp2,&m); // STONESOUP:CONTROL_FLOW:INTERCLASS
    bzero(buffer,BUFFER_SIZE);

    if ( slope == DEFINED_SLOPE ){ /* If the slope is defined, we can use the equation y = mx + b */
      /* Compute the y-intercept of the line formed by the two points given the slope and point on the line */
      /*printf("SERVER: computing the y-intercept using a slope of %f and the point (%d,%d)\n",m,p1.x,p1.y);*/
      float b = compute_y_intercept(m,p1);
      
      /* Prepare the data y = mx + b that will be sent to the client */
      /*printf("SERVER: creating the equation of the line to send back to the client\n");*/
      if (snprintf(buffer,BUFFER_SIZE,"y = (%f)x + %f",m,b) < 0){
	/*perror("SERVER: snprintf() failed\n");*/
	if (close(clisock) == -1){
	  /*perror("SERVER: close(client socket) failed");*/
	}
	if (close(sockfd) == -1){
	  /*perror("SERVER: close(server socket) failed");*/
	}
	printf("10 SERVER ERROR\n");
	exit(EXIT_FAILURE);
      }
    }else{ /* If the slope is undefined, x = p1.x or p2.x (they will be the same in this case */
      /*printf("SERVER: slope is undefined so creating the equation of the line (x = x1) to send back to the client\n");*/
      if (snprintf(buffer,BUFFER_SIZE,"x = %d",p1.x) < 0){
	/*perror("SERVER: snprintf() failed\n");*/
	if (close(clisock) == -1){
	  /*perror("SERVER: close(client socket) failed");*/
	}
	if (close(sockfd) == -1){
	  /*perror("SERVER: close(server socket) failed");*/
	}
	printf("11 SERVER ERROR\n");
	exit(EXIT_FAILURE);
      }
    }
    
    /* Send the data y = mx + b or x = n to the client */
    /*printf("SERVER: writing %s to the client\n",buffer);*/
    if (write(clisock,buffer,BUFFER_SIZE) == -1){
      /*perror("SERVER: write() failed");*/
      if (close(clisock) == -1){
	/*perror("SERVER: close(client socket) failed");*/
      }
      if (close(sockfd) == -1){
        /*perror("SERVER: close(server socket) failed");*/
      }
      printf("12 SERVER ERROR\n");
      exit(EXIT_FAILURE);
    }
    
    /* Closing the socket used to communicate with the client */
    /*printf("SERVER: closing the client socket\n");*/
    if (close(clisock) == -1){
      /*perror("SERVER: close(client socket) failed");*/
      if (close(sockfd) !=0){
	/*perror("SERVER: close() failed");*/
      }
      printf("13 SERVER ERROR\n");
      exit(EXIT_FAILURE);
    }
  }
  return 0;
}

/* This function parses the data from the client to make sure we got something we can 
   recognize. If we find points, we will populate them in p1 and p2.
*/
enum INPUT parse_input(char* buffer,point* p1,point* p2){
  /*printf("SERVER: parsing the data from the client\n");*/
  if (is_match("quit",buffer)){
    /*printf("SERVER: found the quit command, the server will be shutting down momentarily\n");*/
    return INPUT_QUIT;
  }else{ /* If we didn't find the quit command, let's assume we were given an enviornment variable
	    that holds the query string and try to parse it to obtain our two points */
    /*printf("SERVER: found points (%d,%d) and (%d,%d)\n",p1->x,p1->y,p2->x,p2->y);*/   
    char* queryenv = getenv(buffer); // STONESOUP:INTERACTION_POINT // STONESOUP:SOURCE_TAINT:ENVIRONMENT_VARIABLE
    
    if ( queryenv == NULL ){/* The environment variable could not be found return error */
      return INPUT_ERROR;
    }
    
    /* The query string should follow the format "x1=n1&y1=n2&x2=n3&y2=n4" where n1, n2, n3, and n4 are any integer value.*/
    assoc_t query = parse_query_string(queryenv);
    if(!query){ /* Failed ot parse the query string return error */
      return INPUT_ERROR;
    }else{
      assoc_t q = query;
      for(;q->key;q++){
	if(is_match("x1",q->key)){
	  p1->x = atoi(q->val);
	}else if(is_match("y1",q->key)){
	  p1->y = atoi(q->val);
	}else if(is_match("x2",q->key)){
	  p2->x = atoi(q->val);
	}else if(is_match("y2",q->key)){
	  p2->y = atoi(q->val);
	}
      }
      free(query);
      query = NULL;
    }
    return INPUT_POINTS;
  }
}

/*
  This function takes two points (x1, y1) and (x2, y2) and computes the slope of the
  line that is formed by connecting the two points. The slope of a line is computed
  by calculating the following.

  m = (y2 - y1) / (x2 - x1)
*/
enum SLOPE compute_slope(void** p1, void** p2, float* m){
  int dx;
  int dy;
printf("okay"); 
  div_t d = div((dy = compute_difference((**(point**)p2).y
					 ,(**(point**)p1).y)),  // STONESOUP:CROSSOVER_POINT
		(dx = compute_difference((**(point**)p2).x,
					 (**(point**)p1).x))); // STONESOUP:TRIGGER_POINT
  
  /* If there is a remainder, we need to make sure to convert the integer values to 
     floats, when we divide them, to ensure that we obtain an accurate slope value. 
     There is really not reason to do this normally, but, I wanted to try and make the
     test case more interesting than a simple division operation. 
  */
  printf("ok");
printf("%d,%d",d.rem, d.quot);
  if ( dx != 0 ){
    if ( d.rem == 0 ){
      *m = dy/dx;
    }else{
      *m = ((float)dy)/((float)dx);
    }
    return DEFINED_SLOPE;
  }else{
    /* No need to set m */
    return UNDEFINED_SLOPE;
  }
}

/*
  This function takes the slope of a line and a point on the line and computes the 
  y-intercept. Given the equation y = mx + b, we can solve for b producing the 
  equation b = y - mx.
*/
float compute_y_intercept(float m, point p){
  return p.y - (m * p.x);
}

/*
  This function takes two integer values and computes the difference between them.
*/
int compute_difference(int n1, int n2){
  return n1 - n2;
}

/* This function checks to make sure that the two strings are both the same length and that they are the same for
   their entire length.
*/
int is_match(char* str1, char* str2){
  int length;
  if ((length = strlen(str1)) == strlen(str2)){
    if (strncmp(str1,str2,length) == 0){
      return 1;
    }
  }
  return 0;
}
