#include "stdlib.h"
#include "stdint.h"
#include "stdio.h"
#include "limits.h"
int main()
{
	printf("Test int INT32_MAX to short conversion with value loss\n");
	int a=INT32_MAX;
	short c=(short)a;
        printf("Test long long INT64_MAX to int conversion with value loss\n");
	long long along=INT64_MAX;
	int cint=(int)along;
	printf("Test signed(negative) to unsigned cast\n");
	int sint=-1;
	unsigned int uint=(unsigned int)sint;
	printf("Test unsigned UINT_MAX to int\n");
	unsigned u=UINT_MAX;
	int utoi=(int)u;
	printf("Test int INT32_MAX to char\n");
	char ch=(char)INT32_MAX;
}
