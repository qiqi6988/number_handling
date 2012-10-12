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
	printf("End Test");
}

