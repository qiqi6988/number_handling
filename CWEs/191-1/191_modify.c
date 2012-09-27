/*Error 191: Integer Underflow */

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
 /*---------------------------checker starts-----------------------
 detection:
 when detect integer(with type of short,int,long) substraction:(a-b, a*b)
 int-int,int-short,int-long,short-short,short-int,short-long,long-short,long-int,long-long(when judging underflow, we focus only on the type which has more bits between the two numbers because the type has less bits will automatically be converted to the other type; on the other hand, we don't need to care about the assignments, as it will be handled by integer-assignment-error detection module)

a:type A; b:type B
MAX_INT=Max(MAX_TypeA,MAX_TypeB);//if a and b are not belong to the same type, one of them will be converted
MIN_INT=MIN(MIN_TypeA,MIN_TypeB);

action:
if(a<0&&b>0&&(INT_MIN+b)>a)

 {
    printf("Integer Addtion Overflow Happens at :%s Line :%d\n",__FILE__,__LINE__-4);
 } 

if(((a<0 && b>0 )||(a>0 &&b<0)) &&  ((float)MAX_INT+1)/abs(a))<abs(b))
{
 printf("multiplication underflow");
}


 ---------------------------checker ends-------------------------*/
 printf("the result is:%d\n", b);
 printf("End Test Integer Underflow\n");
 return 1;
}
