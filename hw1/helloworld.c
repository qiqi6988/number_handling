#include <stdio.h>

void fun()
{
  printf("hi");
  char a='a';
  printf("%c\n",a);
}

int main()
{
  int i;
  fun();
  scanf("%d", &i);
  printf("%d \n",i);
  printf("end\n");
  return 0;
}
