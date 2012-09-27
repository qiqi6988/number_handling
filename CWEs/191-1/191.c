#include "stdio.h"
#include "stdlib.h"
#include "stdint.h"
int main()
{
 printf("Test Integer Underflow Now:\n");
 printf("Input the number you want to substract:\n");
 int a;
 scanf("%d",&a);
 int num = INT32_MIN+1;
 int b=num-a;
 printf("the result is:%d\n", b);
 printf("End Test Integer Underflow\n");
 return 1;
}


/*
command line and result:
qiqi@qiqi-ThinkPad-R61:~/files/code/integer/CWE$ ./191
Test Integer Underflow Now:
Input the number you want to substract:
1
the result is:-2147483648
End Test Integer Underflow
qiqi@qiqi-ThinkPad-R61:~/files/code/integer/CWE$ ./191
Test Integer Underflow Now:
Input the number you want to substract:
2
CLANG ARITHMETIC UNDEFINED at <191.c, (11:34)> : Op: -, Reason : Signed Subtraction Overflow, BINARY OPERATION: left (int32): -2147483647 right (int32): 2 
the result is:2147483647
End Test Integer Underflow
*/


Manual Solution:
#include "stdio.h"
#include "stdlib.h"
#include "stdint.h"
int main()
{
 printf("Test Integer Underflow Now:\n");
 printf("Input the number you want to substract:\n");
 int a;
 scanf("%d",&a);
 int num = INT32_MIN+1;
 int b=num-a;
 /*---------------------------checker starts-----------------------*/
 if(num<0&&b>0&&(INT32_MIN+b)>num)
 {
    printf("Integer Overflow Happens at :%s Line :%d\n",__FILE__,__LINE__-4);
 } 
 /*---------------------------checker ends-------------------------*/
 printf("the result is:%d\n", b);
 printf("End Test Integer Underflow\n");
 return 1;
}
/*
command line and result:
qiqi@qiqi-ThinkPad-R61:~/files/code/integer/CWE$ ./191_modify
Test Integer Underflow Now:
Input the number you want to substract:
1
the result is:-2147483648
End Test Integer Underflow
qiqi@qiqi-ThinkPad-R61:~/files/code/integer/CWE$ ./191_modify
Test Integer Underflow Now:
Input the number you want to substract:
2
CLANG ARITHMETIC UNDEFINED at <191_modify.c, (11:11)> : Op: -, Reason : Signed Subtraction Overflow, BINARY OPERATION: left (int32): -2147483647 right (int32): 2 
Integer Overflow Happens at :191_modify.c Line :11
the result is:2147483647
End Test Integer Underflow
qiqi@qiqi-ThinkPad-R61:~/files/code/integer/CWE$ 
*/




