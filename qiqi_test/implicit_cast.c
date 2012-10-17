#include "stdlib.h"
#include "stdint.h"
#include "stdio.h"
#include "limits.h"
#include "string.h"
int main()
{
	printf("Implicit Test:\n");
	printf("Test int INT32_MAX to short conversion with value loss\n");
	int a=INT32_MAX;
	short c=a;
	printf("Test int to char\n");
	char chc=a;
        printf("Test implicit long long to int conversion with value loss\n");
	long long along=INT64_MAX;
	int cint=along;
	printf("Test signed to unsigned cast\n");
	int sint=-1;
	unsigned int uint=sint;
	printf("Test unsigned to signed cast\n");
	unsigned int u=UINT_MAX;
	int utos=(int)u;
	printf("Test malloc error:\n");
	int amalloc=-111;
	char * ch=(char *)malloc(sizeof(char)*amalloc);
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
	strncpy(cp1,cp,scpy);

}

