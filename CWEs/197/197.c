#include "stdio.h"
#include "stdlib.h"
#include "stdint.h"

int main()
{
	int max=INT32_MAX;
	short s=max;
	printf("%d,%d\n",max,s);
}


/*------------------------------------------------197(Truncation Error)----------------------------------------
The IOC cant detect it.

Manual solution:
when detect an assignment expr
if(bit_length(type a)<bit_length(type b))
{
	printf("truncation error!");
}
*/
