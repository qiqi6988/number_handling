gcc: countlines.c query.c
	gcc -o countlines_gcc  countlines.c  query.c

ioc: countlines.c query.c
	clang -fioc-abort-on-error -fioc-explicit-conversion -fioc-implicit-conversion -fioc-unsigned -fioc-signed -fioc-shifts -fioc-strict-shifts -o countlines_ioc countlines.c  query.c

ioc_notrap: countlines.c
	clang  -fioc-explicit-conversion -fioc-implicit-conversion -fioc-unsigned -fioc-signed -fioc-shifts -fioc-strict-shifts -o countlines_ioc_notrap countlines.c query.c 

gcc_run_good1: QUERY_STRING = filename=1.java&length=70
gcc_run_good1: countlines_gcc
	./countlines_gcc


gcc_run_good2: QUERY_STRING = filename=2.java&length=120
gcc_run_good2: countlines_gcc 
	./countlines_gcc


gcc_run_bad1: QUERY_STRING = filename=2.java&length=90
gcc_run_bad1: countlines_gcc
	./countlines_gcc

gcc_run_good3: QUERY_STRING = filename=long.java&length=257
gcc_run_good3: countlines_gcc 
	./countlines_gcc

ioc_run_good1: QUERY_STRING = filename=1.java&length=70
ioc_run_good1: countlines_ioc
	./countlines_ioc


ioc_run_good2: QUERY_STRING = filename=2.java&length=120
ioc_run_good2: countlines_ioc 
	./countlines_ioc

ioc_run_good3: QUERY_STRING = filename=long.java&length=257
ioc_run_good3: countlines_ioc
	./countlines_ioc

ioc_run_bad1: QUERY_STRING = filename=2.java&length=90
ioc_run_bad1: countlines_ioc
	./countlines_ioc

clean:
	rm -f *.o
