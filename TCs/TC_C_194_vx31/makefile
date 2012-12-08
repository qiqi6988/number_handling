gcc: countlines.c query.c
	gcc -o countlines_gcc  countlines.c  query.c

ioc: countlines.c query.c
	clang -fioc-abort-on-error -fioc-explicit-conversion -fioc-implicit-conversion -fioc-unsigned -fioc-signed -fioc-shifts -fioc-strict-shifts -o countlines_ioc countlines.c  query.c

ioc_notrap: countlines.c
	clang  -fioc-explicit-conversion -fioc-implicit-conversion -fioc-unsigned -fioc-signed -fioc-shifts -fioc-strict-shifts -o countlines_ioc_notrap countlines.c query.c 



gcc_run_good1: countlines_gcc
	./countlines_gcc

gcc_run_good2: countlines_gcc
	$(shell export QUERY_STRING="filename=2.java&length=120")
	./countlines_gcc


gcc_run_bad1: countlines_gcc
	./countlines_gcc long.java 527

gcc_run_bad2: countlines_gcc
	./countlines_gcc 2.java 90

gcc_run_bad3: countlines_gcc
	./countlines_gcc  hamlet.txt 68

ioc_run_good1: countlines_ioc
	./countlines_ioc 1.java 70

ioc_run_good2: countlines_ioc
	./countlines_ioc 2.java 120

ioc_run_bad1: countlines_ioc
	./countlines_ioc long.java 527

ioc_run_bad2: countlines_ioc
	./countlines_ioc 2.java 90

ioc_run_bad3: countlines_gcc
	./countlines_ioc  hamlet.txt 68

ioc_notrap_run_bad1: countlines_ioc_notrap
	./countlines_ioc_notrap long.java 527

ioc_notrap_run_bad2: countlines_ioc_notrap
	./countlines_ioc_notrap 2.java 90

ioc_notrap_run_bad3: countlines_ioc_notrap
	./countlines_ioc_notrap  hamlet.txt 68

clean:
	rm -f *.o
