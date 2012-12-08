gcc: lower.c 
	gcc -o lower_gcc  lower.c  

ioc: lower.c 
	clang -fioc-abort-on-error -fioc-explicit-conversion -fioc-implicit-conversion -fioc-unsigned -fioc-signed -fioc-shifts -fioc-strict-shifts -o lower_ioc lower.c  

ioc_notrap: lower.c
	clang -fioc-explicit-conversion -fioc-implicit-conversion -fioc-unsigned -fioc-signed -fioc-shifts -fioc-strict-shifts -o lower_ioc_notrap lower.c  

gcc_run_good1: LOWER_TEXT = a
gcc_run_good1: UPPER_TEXT = d
gcc_run_good1: lower_gcc
	./lower_gcc gcc_good1_output
gcc_check_good1: 
	diff gcc_good1_output ../testOutput/output1

gcc_run_good2: LOWER_TEXT = A 
gcc_run_good2: UPPER_TEXT = D
gcc_run_good2: lower_gcc
	./lower_gcc gcc_good2_output
gcc_check_good2: 
	diff gcc_good2_output ../testOutput/output2

gcc_run_bad1: LOWER_TEXT = %80
gcc_run_bad1: UPPER_TEXT = %ff
gcc_run_bad1: lower_gcc
	./lower_gcc gcc_bad1_output
gcc_check_bad1: 
	diff gcc_bad1_output ../testOutput/output3

ioc_run_good1: LOWER_TEXT = a
ioc_run_good1: UPPER_TEXT = d
ioc_run_good1: lower_ioc
	./lower_ioc ioc_good1_output
ioc_check_good1: 
	diff ioc_good1_output ../testOutput/output1

ioc_run_good2: LOWER_TEXT = A
ioc_run_good2: UPPER_TEXT = D
ioc_run_good2: lower_ioc
	./lower_ioc ioc_good2_output
ioc_check_good2: 
	diff ioc_good2_output ../testOutput/output2

ioc_run_bad1: LOWER_TEXT = %80
ioc_run_bad1: UPPER_TEXT = %ff
ioc_run_bad1: lower_ioc
	./lower_ioc ioc_bad1_output
ioc_check_bad1: 
	diff ioc_bad1_output ../testOutput/output3

ioc_notrap_run_good1: LOWER_TEXT = A
ioc_notrap_run_good1: UPPER_TEXT = D
ioc_notrap_run_good1: lower_ioc_notrap
	./lower_ioc_notrap ioc_notrap_good

ioc_notrap_run_bad1: LOWER_TEXT = %80
ioc_notrap_run_bad1: UPPER_TEXT = %ff
ioc_notrap_run_bad1: lower_ioc_notrap
	./lower_ioc_notrap ioc_notrap_bad
clean:
	rm -f *.o
