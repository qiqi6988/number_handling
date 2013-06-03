gcc: countlines
	gcc -o countlines_gcc  countlines.c

ioc: countlines.c 
	clang -fioc-abort-on-error -fioc-explicit-conversion -fioc-implicit-conversion -fioc-unsigned -fioc-signed -fioc-shifts -fioc-strict-shifts -o countlines_ioc countlines.c 




gcc_run_good1:countlines_gcc
	./countlines_gcc ../testData/1.java 2

gcc_run_good2:countlines_gcc
	./countlines_gcc ../testData/2.java 1

gcc_run_bad1: countlines_gcc
	./countlines_gcc  ../testData/1.java 3
gcc_run_bad2:countlines_gcc
	./countlines_gcc  ../testData/hamlet.txt

ioc_run_good1:countlines_ioc
	./countlines_ioc ../testData/1.java 2

ioc_run_good2:countlines_ioc
	./countlines_ioc ../testData/2.java 1

ioc_run_bad1: countlines_ioc
	./countlines_ioc  ../testData/1.java 3
ioc_run_bad2:countlines_ioc
	./countlines_ioc  ../testData/hamlet.txt	



clean:
	rm -f *.o
