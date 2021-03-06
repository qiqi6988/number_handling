#include "stdlib.h"
#include "stdio.h"

int main()
{
	printf("input a number:\n");
	int a;
	scanf("%d",&a);
	char * cp;
	if(a<100)
	{
		cp=(char *)malloc(sizeof(char)*a);
	}
	return 0;
}

/*----------------------------------------------------
This kind of error is hard to detect because it is very hard
to find out whether the variable is used under a positive context
or not. 

manual solution:
if encounter (malloc(a)||memcpy(XX,XX,a)||strcpy(XX,XX,a)) && a's type is signed(int, short, long, double, float...)
printf("malloc/memcpy/strcpy with a negative number")


About the IOC:
IOC can't detect it
------------------------------------------------------*/
