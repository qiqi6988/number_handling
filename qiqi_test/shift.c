#include "stdlib.h"
#include "stdint.h"
#include "stdio.h"
#include "limits.h"
int main()
{
	int a=1;
	printf("shift an integer by 32 and 33 bits\n");
	int b=a<<32;
	int c=a<<33;
	printf("shift an unsigned integer by 32 and 33 bits\n");
	unsigned int a1=1;
	unsigned int b1=a1<<32;
	unsigned int c1=a1<<33;
	printf ("shift a char by 33 and 17\n");
	char ch='a';
	char ch1=ch<<33;
	printf("%c\n",ch1);
	char ch2=ch<<17;
	printf("%c\n",ch2);
	printf("shift a short by 32\n");
	short s=-1;
	short s2=s<<32;
	return 0;
}
