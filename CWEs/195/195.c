#include "stdio.h"
#include "stdlib.h"

int main()
{
 printf("Start conversion from signed to unsigned:\n");
 int i;
 printf("input the signed integer you want to convert\n");
 scanf("%d",&i);
 unsigned u=i;
 /*checker starts
 if(i<0  && typeof(i)==signed && typeof(u)==unsigned)
    printf("signed to unsigned error!");
  
 when encounter following functions:
  malloc(a) strncpy(XX,XX,a),memncpy(XX,XX,a);
 if(typeof(a)==signed && a<0)
  {
    printf("signed to unsigned error!" );
  }

 checker ends */
 printf("the original integer is: %d, the converted one is: %u\n", i, u);
 printf("End test");
 return 0;
}

/*
command lines and results(the IOC ignores this error);
qiqi@qiqi-ThinkPad-R61:~/files/code/integer/CWE/195$ clang -fcatch-undefined-ansic-behavior -O 195.c -o 195
qiqi@qiqi-ThinkPad-R61:~/files/code/integer/CWE/195$ ./195
Start conversion from signed to unsigned:
input the signed integer you want to convert
1
the original integer is: 1, the converted one is: 1
End testqiqi@qiqi-ThinkPad-R61:~/files/code/integer/CWE/195$ ./195
Start conversion from signed to unsigned:
input the signed integer you want to convert
-1
the original integer is: -1, the converted one is: 4294967295
*/

