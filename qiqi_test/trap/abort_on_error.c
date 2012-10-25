#include "stdlib.h"
#include "stdint.h"
#include "stdio.h"
#include "limits.h"

int main()
{
	int a=INT32_MAX;
	short b=a;
	printf("Not aborted!\n");//if the abort_on_error works it will not print out this line;
	return 1;
}
