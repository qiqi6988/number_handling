#include "stdlib.h"
#include "stdint.h"
#include "stdio.h"
#include "limits.h"
#include "string.h"
int main()
{
	printf("Implicit Memset Cast Test:\n");
	char * cp,*cp1;
	cp=(char *)malloc(sizeof(char)*10000);
	if(cp==NULL)
	{
		printf("mallocerror\n");
	}
	if(cp1==NULL)
	{	
		printf("mallocerror1\n");
	}
	printf("Test memset:\n");
	int scpy=-124;		
	memset(cp1,'a',scpy);

}

