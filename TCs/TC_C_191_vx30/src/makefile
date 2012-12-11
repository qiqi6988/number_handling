gcc: recaman.c query.c
	gcc -o recaman_gcc  recaman.c  query.c

ioc: recaman.c query.c
	clang -fioc-abort-on-error -fioc-explicit-conversion -fioc-implicit-conversion -fioc-unsigned -fioc-signed -fioc-shifts -fioc-strict-shifts -o recaman_ioc recaman.c  query.c

ioc_notrap: recaman.c query.c
	clang  -fioc-explicit-conversion -fioc-implicit-conversion -fioc-unsigned -fioc-signed -fioc-shifts -fioc-strict-shifts -o recaman_ioc_notrap recaman.c query.c

gcc_run_good1: QUERY_STRING = seqnum=-1
gcc_run_good1: recaman_gcc
	./recaman_gcc

ioc_run_good1: QUERY_STRING = seqnum=-1
ioc_run_good1:recaman_ioc
	./recaman_ioc 

gcc_run_good2: QUERY_STRING = seqnum=123
gcc_run_good2: recaman_gcc
	./recaman_gcc

ioc_run_good2: QUERY_STRING = seqnum=123
ioc_run_good2:recaman_ioc
	./recaman_ioc 



gcc_run_good3: QUERY_STRING = seqnum=0
gcc_run_good3: recaman_gcc
	./recaman_gcc

ioc_run_good3: QUERY_STRING = seqnum=0
ioc_run_good3:recaman_ioc
	./recaman_ioc 

gcc_run_bad1: QUERY_STRING = seqnum=129
gcc_run_bad1: recaman_gcc
	./recaman_gcc 

ioc_run_bad1: QUERY_STRING = seqnum=129
ioc_run_bad1:recaman_ioc
	./recaman_ioc 


clean:
	rm -f *.o
