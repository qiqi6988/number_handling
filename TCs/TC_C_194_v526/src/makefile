gcc: countlines.c 
	gcc -o countlines_gcc  countlines.c  

ioc: countlines.c 
	clang -fioc-abort-on-error -fioc-explicit-conversion -fioc-implicit-conversion -fioc-unsigned -fioc-signed -fioc-shifts -fioc-strict-shifts -o countlines_ioc countlines.c  

ioc_notrap: countlines.c
	clang  -fioc-explicit-conversion -fioc-implicit-conversion -fioc-unsigned -fioc-signed -fioc-shifts -fioc-strict-shifts -o countlines_ioc_notrap countlines.c 


gcc_run_good1: countlines_gcc
	./countlines_gcc  1.java 70

ioc_run_good1:countlines_ioc
	./countlines_ioc  1.java 70

gcc_run_good2: countlines_gcc
	./countlines_gcc 2.java 120

ioc_run_good2:countlines_ioc
	./countlines_ioc 2.java 120


gcc_run_bad1: countlines_gcc
	./countlines_gcc 1.java 60

ioc_run_bad1:countlines_ioc
	./countlines_ioc 1.java 60


gcc_run_bad2: countlines_gcc
	./countlines_gcc 2.java 90

ioc_run_bad2:countlines_ioc
	./countlines_ioc 2.java 90



gcc_run_bad3: countlines_gcc
	./countlines_gcc hamlet.txt 68

ioc_run_bad3:countlines_ioc
	./countlines_ioc hamlet.txt 68

clean:
	rm -f *.o
