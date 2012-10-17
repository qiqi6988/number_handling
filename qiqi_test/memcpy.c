#include "stdlib.h"
#include "stdint.h"
#include "stdio.h"
#include "limits.h"
#include "string.h"
int main()
{
	char * cp,*cp1;
	cp=(char *)malloc(sizeof(char)*INT32_MAX);
	cp1=(char *)malloc(sizeof(char)*INT32_MAX);
	if(cp==NULL)
	{
		printf("mallocerror\n");
	}
	if(cp1==NULL)
	{	
		printf("mallocerror1\n");
	}
	printf("Test strncpy:\n");
	int scpy=-123;		
	memcpy(cp1,cp,scpy);
}
