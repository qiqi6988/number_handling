## Message  from Maggie on Sept 20, 2012 ##

qiqi@qiqi-ThinkPad-R61:~/files/llvm/lib/Transforms/Helloworld$ clang -O3 -emit-llvm helloworld.c -c -o hello.bc
qiqi@qiqi-ThinkPad-R61:~/files/llvm/lib/Transforms/Helloworld$ opt -load ../../../Release+Asserts/lib/replace.so -replace < hello.bc > /dev/null
find a call in fun:printf
find a call in fun:printf
find a call in main:printf //seems this belong to the fun() which the main calls
find a call in main:printf//this also seems belong to the fun() the main calls
find a call in main:__isoc99_scanf
find a call in main:printf
find a call in main:puts  //as the last printf has no format output, maybe it could be substituted by puts,so the last printf turns to puts?but the first printf in fun() also doesn't include format output...
