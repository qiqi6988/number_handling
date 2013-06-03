gcc: countlines.c 
	gcc -o countlines_gcc  countlines.c  

ioc: countlines.c 
	clang -fioc-abort-on-error -fioc-explicit-conversion -fioc-implicit-conversion -fioc-unsigned -fioc-signed -fioc-shifts -fioc-strict-shifts -o countlines_ioc countlines.c  

ioc_notrap: countlines.c
	clang  -fioc-explicit-conversion -fioc-implicit-conversion -fioc-unsigned -fioc-signed -fioc-shifts -fioc-strict-shifts -o countlines_ioc_notrap countlines.c 


gcc_run_good: countlines_gcc
	./countlines_gcc 3.java

ioc_run_good:countlines_ioc
	./countlines_ioc 3.java

ioc_notrap_run_good: countlines_ioc_notrap
	./countlines_ioc_notrap 3.java

gcc_run_better: countlines_gcc
	./countlines_gcc 1.java

ioc_run_better:countlines_ioc
	./countlines_ioc 1.java

ioc_notrap_run_better: countlines_ioc_notrap
	./countlines_ioc_notrap 1.java



gcc_run_bad1: countlines_gcc
	./countlines_gcc 4.java

ioc_run_bad1:countlines_ioc
	./countlines_ioc 4.java

ioc_notrap_run_bad1: countlines_ioc_notrap
	./countlines_ioc_notrap 4.java


gcc_run_bad2: countlines_gcc
	./countlines_gcc hamlet.txt

ioc_run_bad2:countlines_ioc
	./countlines_ioc hamlet.txt

ioc_notrap_run_bad2: countlines_ioc_notrap
	./countlines_ioc_notrap hamlet.txt

clean:
	rm -f *.o
