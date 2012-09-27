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
 /*
 manual solution:
 if(typeof(u)==unsigned && typeof(s)==signed && sizeof(u)>sizeof(s) && s<0)
 {
   printf("signed-extened error at File: %s, Line: %d \n",__FILE__,__LINE__-5 );
 }

 when encounter following functions:
 malloc(a) strncpy(XX,XX,a),memncpy(XX,XX,a);
 if(typeof(a)==signed && a<0 && sizeof(size_t)>sizeof(a) && a<0)
  {
    printf("signed-extened error at File: %s, Line: %d \n",__FILE__,__LINE__-3 );
  }

 
*/
 printf("The original short int is %d, the converted unsigned int is %u\n",s,u);
 return 0;
}