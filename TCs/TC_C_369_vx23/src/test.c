#include <stdio.h>
#include <stdlib.h>
int main()
{
	int y=1;
	int x=0;
	//float a=y/x;
	div_t d=div(1,0);
	printf("%d,%d\n",d.quot,d.rem);
	
	//printf("%f",a);
}
