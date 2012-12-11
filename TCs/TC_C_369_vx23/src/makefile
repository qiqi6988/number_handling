gcc: mainserver.c query.c
	gcc -o mainserver_gcc  mainserver.c  query.c

ioc: mainserver.c query.c
	clang -fioc-abort-on-error -fioc-explicit-conversion -fioc-implicit-conversion -fioc-unsigned -fioc-signed -fioc-shifts -fioc-strict-shifts -o mainserver_ioc mainserver.c query.c

ioc_notrap: mainserver.c query.c
	clang  -fioc-explicit-conversion -fioc-implicit-conversion -fioc-unsigned -fioc-signed -fioc-shifts -fioc-strict-shifts -o mainserver_ioc_notrap mainserver.c query.c
run_good1_client: QUERY_STRING1 = x1=1&y1=-2&x2=3&y2=4
run_good1_client: client
	./client QUERY_STRING1

run_good2_client:QUERY_STRING2= x1=42&y1=2&x2=-23&y2=2
run_good2_client:client
	./client QUERY_STRING2

run_good3_client:QUERY_STRING3= x1=-12&y1=-322&x2=-252&y2=-94
run_good3_client: client
	./client QUERY_STRING3

run_bad1_client:QUERY_STRING4 = x1=2&y1=5&x2=2&y2=8
run_bad1_client:client
	./client QUERY_STRING4

gcc_run_good1: QUERY_STRING1 = x1=1&y1=-2&x2=3&y2=4
gcc_run_good1: mainserver_gcc
	./mainserver_gcc 

gcc_run_good2: QUERY_STRING2= x1=42&y1=2&x2=-23&y2=2
gcc_run_good2: mainserver_gcc
	./mainserver_gcc 

gcc_run_good3: QUERY_STRING3= x1=-12&y1=-322&x2=-252&y2=-94
gcc_run_good3: mainserver_gcc
	./mainserver_gcc 

gcc_run_bad1: QUERY_STRING4 = x1=2&y1=5&x2=2&y2=8
gcc_run_bad1:mainserver_gcc
	./mainserver_gcc

ioc_run_good1: QUERY_STRING1 = x1=1&y1=-2&x2=3&y2=4
ioc_run_good1: mainserver_ioc
	./mainserver_ioc 

ioc_run_good2: QUERY_STRING2= x1=42&y1=2&x2=-23&y2=2
ioc_run_good2: mainserver_ioc
	./mainserver_ioc 

ioc_run_good3: QUERY_STRING3= x1=-12&y1=-322&x2=-252&y2=-94
ioc_run_good3: mainserver_ioc
	./mainserver_ioc 

ioc_run_bad1: QUERY_STRING4 = x1=2&y1=5&x2=2&y2=8
ioc_run_bad1:mainserver_ioc
	./mainserver_ioc




clean:
	rm -f *.o
