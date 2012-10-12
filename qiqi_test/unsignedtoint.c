#include "stdio.h"
#include "stdlib.h"
#include "limits.h"

int main()
{
 printf("Start conversion from unsigned to signed:\n");
 unsigned u=UINT_MAX;
 int i=u;
 printf("the original unsigned integer is: %u, the converted signed integer is: %d\n", u, i);
 printf("End test");
 return 0;
}

