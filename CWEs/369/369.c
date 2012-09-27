#include "stdio.h"

int main()
{
 int i,j;
 printf("input the two numbers you want to divide:\n");
 scanf("%d %d",&i,&j);
 float f=(float)i/j;
 /* checker:
  if(j==0)
  {
   printf("divide by 0 error occurs");
  } 
 */
 printf("the result is %f\n",f);
}

/*
command lines and results:(IOC catches the error)
qiqi@qiqi-ThinkPad-R61:~/files/code/integer/CWE/369$ clang -fcatch-undefined-ansic-behavior -O 369.c -o 369
qiqi@qiqi-ThinkPad-R61:~/files/code/integer/CWE/369$ ./369
input the two numbers you want to divide:
1 2
the result is 0.500000
qiqi@qiqi-ThinkPad-R61:~/files/code/integer/CWE/369$ ./369
input the two numbers you want to divide:
1 0
CLANG ARITHMETIC UNDEFINED at <369.c, (8:18)> : Op: /, Reason : Floating Division: Divisor is 0, BINARY OPERATION: left (float): 1.000000 right (float): 0.000000 
the result is inf
*/
