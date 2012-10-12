#include "stdlib.h"
#include "stdint.h"
#include "stdio.h"
int main()
{
	printf("Implicit Test:cast:\n");
	printf("Test int to short conversion with value loss\n");
	int a=INT32_MAX;
	short c=a;
	printf("int=%d, short=%d\n",a,c);
	printf("End Test int to short conversion\n");
        printf("Test implicit long long to int conversion with value loss\n");
	long long along=INT64_MAX;
	int cint=along;
	printf("longlong=%d, int=%d\n",a,c);
	printf("End Test longlong to int\n");
	printf("Test signed to unsigned cast\n");
	int sint=-1;
	unsigned int uint=sint;
	printf("signed int=%d, unsigned int=%u\n",sint,uint);
	printf("End Test signed int to unsigned int\n");

}

