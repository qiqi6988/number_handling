#include "stdlib.h"
#include "stdint.h"
#include "stdio.h"
int main()
{
        printf("Test Integer Overflow:\n");
        int a=INT32_MAX;
        int b=a+1;
        printf("a=%d, a+1=%d\n",a,b);
        printf("End Test integer overflow\n");

}
