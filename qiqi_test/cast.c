#include "stdlib.h"
#include "stdint.h"
#include "stdio.h"
int main()
{
	printf("Test:cast:\n");
	printf("Test int to short conversion with value loss\n");
	int a=INT32_MAX;
	short c=(short)a;
	printf("int=%d, short=%d\n",a,c);
	printf("End Test int to short conversion\n");
        printf("Test long long to int conversion with value loss\n");
	long long along=INT64_MAX;
	int cint=(int)along;
	printf("longlong=%d, int=%d\n",a,c);
	printf("Test signed to unsigned cast\n");
	printf("End Test longlong to int\n");
	int sint=-1;
	unsigned int uint=(unsigned int)sint;
	printf("signed int=%d, unsigned int=%u\n",sint,uint);
	printf("End Test signed int to unsigned int\n");

}
