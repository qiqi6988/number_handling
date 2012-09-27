//Numeric Truncation Error(CWE 197)

#include "stdio.h"
#include "stdlib.h"
#include "stdint.h"
int main()
{
 printf("Test Numeric Truncation Error Now:\n");
 int a=INT32_MAX;
 short b=a;
 printf("original integer a is:%d, the casted short integer is:%d\n", a,b);
 printf("End Test Numeric Truncation Error\n");
 return 1;
}


/*
//---------------------------------------result---------------------------------------
qiqi@qiqi-ThinkPad-R61:~/files/code/integer/CWE/new/197$ ./197
Test Numeric Truncation Error Now:
original integer a is:2147483647, the casted short integer is:-1
End Test Numeric Truncation Error
//----------------------------------------compile by IOC------------------------------

*/
