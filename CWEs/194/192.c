#include "stdlib.h"
#include "stdio.h"
#include "stdint.h"
#include "limits.h"

int main()
{
 printf("Test Conversion from Short Int to Unsigned Int\n");
 //short s=-1;//0xffff
 printf("input the original short int:\n");
 short s;
 scanf("%hd",&s);
 unsigned u=s;
 printf("The original short int is %d, the converted unsigned int is %u\n",s,u);
 return 0;
}

/*
command lines and results:(the IOC ignores signed-extended errors)
qiqi@qiqi-ThinkPad-R61:~/files/code/integer/CWE/192$ clang -fcatch-undefined-ansic-behavior -O 192.c -o 192
qiqi@qiqi-ThinkPad-R61:~/files/code/integer/CWE/192$ ./192
Test Conversion from Short Int to Unsigned Int
input the original short int:
1
The original short int is 1, the converted unsigned int is 1
qiqi@qiqi-ThinkPad-R61:~/files/code/integer/CWE/192$ ./192
Test Conversion from Short Int to Unsigned Int
input the original short int:
-1
The original short int is -1, the converted unsigned int is 4294967295

*/

