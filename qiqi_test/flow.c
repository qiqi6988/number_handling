#include "stdlib.h"
#include "stdint.h"
#include "stdio.h"
#include "limits.h"
int main()
{
        printf("Test Integer Underflow\n");
        int a1=INT32_MIN;
        int b1=a1-1;
   

  	printf("Test Integer Overflow:\n");
        int a=INT32_MAX;
        int b=a+1;

	printf("Test unsigned underflow\n");
	unsigned c1=0;
	unsigned c11=c1-1;

	printf("Test unsigned overflow\n");
        unsigned cd1=UINT_MAX;
	unsigned cd2=cd1+1;
}       
