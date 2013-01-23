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

** Variant Spreadsheet ID: TC_C_369_vx24

** Derived From: TC_C_369_base2

** Variant Features: SOURCE_TAINT:FILE_NAME

**                   DATA_TYPE:UNSIGNED_LONG

**                   DATA_FLOW:PASS_BY_REFERENCE

**                   CONTROL_FLOW:CALLBACK

** Variant Author: Danny Haynes

** Technical Impact: DoS (uncontrolled exit/crash)

** I/0 Pairs (should be passed to the client):

**   Good: 1st Set:slope in file 1

**         2nd Set:slope in file 2

**         3rd Set:slope in file 3

**         4th Set:

**         5th Set:

**    Bad: 1st Set:slope in file 4

**         2nd Set:

** Note: Program requires that x1,y1,x2,y2 > 0 and that y2 - y1 > 0 and x2 - x1 > 0.

**

** How program works:

**     The program is run with ./tc_c_369_vx24_server

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
#include <dirent.h>

#define BUFFER_SIZE 1024

/* This struct represents a point on a coordinate plane (x, y). */
typedef struct point{
  unsigned long x;
  unsigned long y;
}point;

/* This tells us what type of data we found and parsed from the command line.  */
enum INPUT {INPUT_POINTS, /* Found and parsed x1 y1 x2 y2 */
            INPUT_QUIT,   /* Found the quit command, let's shut down the server */
            INPUT_ERROR}; /* There was an error while parsing the data, let's quit */

/* This enumeration lets us indicate whether or not the slope is defined or not. */
enum SLOPE {DEFINED_SLOPE, /* dy/dx is some number; y = mx + b */
	    UNDEFINED_SLOPE /* dy/dx = undefined (dx = 0); x = n where n is some integer */
};

/* This function parses the data and if successful will let us know if we have to quit
   or if we have our valid points.
*/
enum INPUT parse_input(char*,point*,point*);

/* This function computes the slope of the line given two points. */
enum SLOPE compute_slope(point,point,float*);

/* This function computes the y-intercept of the line given the slope and a point
   on the line.
*/
float compute_y_intercept(float,point);

/* This function computes the difference between two integer values. */
unsigned long compute_difference(unsigned long*,unsigned long*);

/* This function compares two strings based on length and whether or not all of the
   characters match for the entire length of the strings.
*/
int is_match(char*,char*);

/* This function returns true if we need to use floating point precision when calculating the slope of a line. */
unsigned long precision_needed(unsigned long*,unsigned long*);

/* This function is a call back function that takes a function that performs a mathematical operation on two
   integer values and returns an integer value.
*/
unsigned long compute_integer_math(unsigned long(*function_1)(unsigned long*,unsigned long*),unsigned long*,unsigned long*);

/* This function checks the current directory to see if there are any files with names in the form 'slope.x1.y1.x2.y2.dat'. 
   If it finds any it will check the client message 'slope in file n' and see if it can get that nth one which if it finds,
   it will return the input from the filename in the form 'x1 y1 x2 y2'
*/
int get_input(char*,char*);
  
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
    if (read(clisock,buffer,BUFFER_SIZE) == -1){ //STONESOUP:INTERACTION_POINT
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
    char out[BUFFER_SIZE];
    bzero(out,BUFFER_SIZE);
        
    if (get_input(buffer,out) == 0){
      printf("9 SERVER ERROR\n");
      exit(EXIT_FAILURE);
    }

    if ((input = parse_input(out,&p1,&p2)) != INPUT_POINTS){
      if (close(clisock) == -1){
        /*perror("SERVER: close(client socket) failed");*/
      }
      if (close(sockfd) == -1){
        /*perror("SERVER: close(server socket) failed");*/
      }
      
      if (input == INPUT_ERROR){
	printf("10 SERVER ERROR\n");
       	exit(EXIT_FAILURE);
      }else{
	/*printf("SERVER: closing the server\n");*/
	exit(EXIT_SUCCESS);
      }
    }

    /*printf("SERVER: found points (%d,%d) and (%d,%d)\n",p1.x,p1.y,p2.x,p2.y);*/
    
    /* Compute the slope of the line formed by the two given points */
    /*printf("SERVER: computing the slope for (%d,%d) and (%d,%d))\n",p1.x,p1.y,p2.x,p2.y);*/

    float m;
    enum SLOPE slope = compute_slope(p1,p2,&m);
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
	printf("11 SERVER ERROR\n");
	exit(EXIT_FAILURE);
      }
    }else{ /* If the slope is undefined, x = p1.x or p2.x (they will be the same in this case */
      /*printf("SERVER: slope is undefined so creating the equation of the line (x = x1) to send back to the client\n");*/
      if (snprintf(buffer,BUFFER_SIZE,"x = %lu",p1.x) < 0){
	/*perror("SERVER: snprintf() failed\n");*/
	if (close(clisock) == -1){
	  /*perror("SERVER: close(client socket) failed");*/
	}
	if (close(sockfd) == -1){
	  /*perror("SERVER: close(server socket) failed");*/
	}
	printf("12 SERVER ERROR\n");
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
      printf("13 SERVER ERROR\n");
      exit(EXIT_FAILURE);
    }
    
    /* Closing the socket used to communicate with the client */
    /*printf("SERVER: closing the client socket\n");*/
    if (close(clisock) == -1){
      /*perror("SERVER: close(client socket) failed");*/
      if (close(sockfd) !=0){
	/*perror("SERVER: close() failed");*/
      }
      printf("14 SERVER ERROR\n");
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
  }else{ /* If we didn't find the quit command, let's try to parse it as if we have our two points */
    if (sscanf(buffer,"%lu %lu %lu %lu",&(p1->x),&(p1->y),&(p2->x),&(p2->y)) == EOF){ //STONESOUP:DATA_TYPE:UNSIGNED_LONG
      /*perror("SERVER: sscanf() failed");*/
      return INPUT_ERROR;
    }
    /*printf("SERVER: found points (%d,%d) and (%d,%d)\n",p1->x,p1->y,p2->x,p2->y);*/
    return INPUT_POINTS;
  }
}

/*
  This function takes two points (x1, y1) and (x2, y2) and computes the slope of the
  line that is formed by connecting the two points. The slope of a line is computed
  by calculating the following.

  m = (y2 - y1) / (x2 - x1)
*/
enum SLOPE compute_slope(point p1, point p2,float* m){
  unsigned long dx = compute_integer_math(compute_difference, &p2.x, &p1.x);
  unsigned long dy = compute_integer_math(compute_difference, &p2.y, &p1.y);
  unsigned long precision = compute_integer_math(precision_needed,&dx,&dy); //STONESOUP:CROSSOVER_POINT //STONESOUP:DATA_FLOW:PASS_BY_REFERENCE //STONESOUP:CONTROL_FLOW:CALLBACK
  
			       
  /* If there is a remainder, we need to make sure to convert the integer values to 
     floats, when we divide them, to ensure that we obtain an accurate slope value. 
     There is really not reason to do this normally, but, I wanted to try and make the
     test case more interesting than a simple division operation. 
  */
  if ( dx != 0 ){
    if ( !precision ){
      *m = dy/dx;
    }else{
      float y = dy;
      float x = dx;
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
unsigned long compute_difference(unsigned long* n1, unsigned long* n2){
  return *n1 - *n2;
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

/* This function determines whether or not we need floating precision when calculating our slope. */
unsigned long precision_needed(unsigned long* dx, unsigned long* dy){  
  lldiv_t d = lldiv(*dy,
                *dx); // STONESOUP:TRIGGER_POINT
  if ( d.rem == 0 ){
    return 0;
  }else{
    return 1;
  }
}
 
/* This is a call back function will perform the specified operation on the two specified integer values */
unsigned long compute_integer_math(unsigned long(*function_1)(unsigned long*,unsigned long*),unsigned long* n1,unsigned long* n2){
   return function_1(n1,n2); 
}

/* This function searches the current directory for any filenames that begin with "slope.", parses the filename as input, and 
   uses it to compute the slope of the line.
*/
int get_input(char* in,char* out){
  /* If a quit command was given don't bother parsing anymore and return */
  if (is_match("quit",in)){
    strncpy(out,in,strlen(in));
    out[strlen(in)] = '\0';
    return 1;
  }

  int fn;
  int i = 1;
  DIR* dir = opendir(".");
  struct dirent* d = NULL;
  point* p1,*p2;
  char filename[256];

  /* Format from client 'slope in file 2' */
  char* slopep = strtok(in," ");
  char* inp = strtok(NULL," ");
  char* filep = strtok(NULL," ");
  char* nump = strtok(NULL," ");
  char* r = NULL;

  /* If nump is NULL we don't have the file number and cannot search the files. So report an error. */
  if (nump == NULL){
    return 0;
  }

  if (dir != NULL){
    while ((d = readdir(dir)) != NULL){ //STONESOUP:SOURCE_TAINT:FILE_NAME
      /* Zero out the array so we can reuse it */
      bzero(filename,256);      
      /* Build up the format for matching 'slope-#.x1.y1.x2.y2.dat' */
      r = strncat(filename,"slope-",6);
      r = strncat(filename,nump,strlen(nump));
      r = strncat(filename,".",1);
 
     if (strncmp(filename,d->d_name,strlen(filename)) == 0){
	/* Format slope.x1.y1.x2.y2.dat */
	char* slope = strtok(d->d_name,".");
	char* x1 = strtok(NULL,".");
	char* y1 = strtok(NULL,".");
	char* x2 = strtok(NULL,".");
	char* y2 = strtok(NULL,".");
	char* dat = strtok(NULL,".");
	
	if (snprintf(out,BUFFER_SIZE,"%s %s %s %s",x1,y1,x2,y2) < 0){
	  if (closedir(dir) == -1){
	    /*perror("closedir() failed");*/
	  }
	  return 0;
	}
	return 1;
      }
    }
  }
  if (closedir(dir) == -1){
    /*perror("closedir() failed");*/
  }
  return 0;
}
