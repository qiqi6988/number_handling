/* This program is used to extract a secret value from the lower
   program.  Use it to generate input for the program, and the secret
   will be revealed. */

#include <stdio.h>
int
main2 (int argc, char **argv)
{
  int i;
  for (i = 128; i < 256; i++)
    putchar (i);
  return 0;
}
