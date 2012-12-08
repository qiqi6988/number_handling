gcc: lower.c query.c
	gcc -o lower_gcc  lower.c  query.c

ioc: lower.c query.c
	clang -fioc-abort-on-error -fioc-explicit-conversion -fioc-implicit-conversion -fioc-unsigned -fioc-signed -fioc-shifts -fioc-strict-shifts -o lower_ioc lower.c  query.c

ioc_notrap: lower.c query.c
	clang -fioc-explicit-conversion -fioc-implicit-conversion -fioc-unsigned -fioc-signed -fioc-shifts -fioc-strict-shifts -o lower_ioc_notrap lower.c  query.c

gcc_run_good1: QUERY_STRING = lower=a&upper=d
gcc_run_good1: lower_gcc
	./lower_gcc gcc_good1_output
gcc_check_good1: 
	diff gcc_good1_output ../testOutput/output1

gcc_run_good2: QUERY_STRING = lower=A&upper=D
gcc_run_good2: lower_gcc
	./lower_gcc gcc_good2_output
gcc_check_good2: 
	diff gcc_good2_output ../testOutput/output2

gcc_run_bad1: QUERY_STRING = lower=%80&upper=%ff
gcc_run_bad1: lower_gcc
	./lower_gcc gcc_bad1_output
gcc_check_bad1: 
	diff gcc_bad1_output ../testOutput/output3

ioc_run_good1: QUERY_STRING = lower=a&upper=d
ioc_run_good1: lower_ioc
	./lower_ioc ioc_good1_output
ioc_check_good1: 
	diff ioc_good1_output ../testOutput/output1

ioc_run_good2: QUERY_STRING = lower=A&upper=D
ioc_run_good2: lower_ioc
	./lower_ioc ioc_good2_output
ioc_check_good2: 
	diff ioc_good2_output ../testOutput/output2

ioc_run_bad1: QUERY_STRING = lower=%80&upper=%ff
ioc_run_bad1: lower_ioc
	./lower_ioc ioc_bad1_output
ioc_check_bad1: 
	diff ioc_bad1_output ../testOutput/output3

ioc_notrap_run_bad1:QUERY_STRING = lower=%80&upper=%ff
ioc_notrap_run_bad1: lower_ioc_notrap
	./lower_ioc_notrap testfile

clean:
	rm -f *.o
