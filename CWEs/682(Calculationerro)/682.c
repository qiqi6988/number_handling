#include "stdio.h"
#include "stdlib.h"


int main()
{
	int * p=malloc(sizeof(int)*4);
	p[1]=1;
	p[2]=2;
	char * cp=(char *)(p+1);
}

/*-------------------------------------------------------------
This calculation problem contains many different types of calculation errors. As to the three examples mentioned in CWE, the first two will be covered by integer overflow and divided by zero erro. The last one, as is shown in the code, is hard to detect because we don't know exactly what the programmer wants, the only thing we could do is to assume that the conversion from a pointer type to a different pointer type is always not the programmer's hope.

manual solution:
if detect a expr which convert one type of pointer to another type pointer(cp is pointer && p is pointer && cp's type!=p's type)
{printf("pointer conversion error")}

IOC:can't detect


*/
