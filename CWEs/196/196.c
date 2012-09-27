#include "stdio.h"
#include "stdlib.h"
#include "limits.h"

int main()
{
 printf("Start conversion from unsigned to signed:\n");
 unsigned u=UINT_MAX;
 int i=u;
 /*checker starts
 if(typeof(u)==unsigned && u&0x80000000==0x80000000  && typeof(i)==signed)
    printf("unsigned to signed error!");
 
 checker ends */
 printf("the original unsigned integer is: %u, the converted signed integer is: %d\n", u, i);
 printf("End test");
 return 0;
}
/*
command lines and results:(IOC ignores this error)
qiqi@qiqi-ThinkPad-R61:~/files/code/integer/CWE/196$ ./196
Start conversion from unsigned to signed:
the original unsigned integer is: 4294967295, the converted signed integer is: -1
*/
