#include "stdlib.h"
#include "stdint.h"
#include "stdio.h"
int main()
{
        printf("Test Integer Underflow\n");
        int a1=INT32_MIN;
        int b1=a1-1;
        printf("a=%d, a-1=%d",a1,b1);
        printf("End Test Integer Underflow\n");
}       
