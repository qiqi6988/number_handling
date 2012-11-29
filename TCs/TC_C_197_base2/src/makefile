gcc: lower.c 
	gcc -o lower_gcc  lower.c  

ioc: lower.c 
	clang -fioc-abort-on-error -fioc-explicit-conversion -fioc-implicit-conversion -fioc-unsigned -fioc-signed -fioc-shifts -fioc-strict-shifts -o lower_ioc lower.c  





gcc_run_good1: lower_gcc
	./lower_gcc -o gcc_good1_output 2.java
gcc_test_good1: 
	diff gcc_good1_output output.2

ioc_run_good1:lower_ioc
	./lower_ioc -o ioc_good1_output 2.java
ioc_test_good1:
	diff ioc_good1_output output.2



gcc_run_good2: lower_gcc
	./lower_gcc -o gcc_good2_output 5.java
gcc_test_good2:
	diff gcc_good2_output output.3

ioc_run_good2: lower_ioc
	./lower_ioc -o ioc_good2_output 5.java
ioc_test_good2:
	diff ioc_good2_output output.3




gcc_run_good3: lower_gcc
	./lower_gcc -o gcc_good3_output bigOut.txt
gcc_test_good3: 
	diff gcc_good3_output output.4
ioc_run_good3: lower_ioc
	./lower_ioc -o ioc_good3_output bigOut.txt
ioc_test_good3: 
	diff ioc_good3_output output.4



gcc_run_bad1: lower_gcc
	./lower_gcc -o gcc_bad1_output data
gcc_test_bad1: 
	diff gcc_bad1_output output
ioc_run_bad1: lower_ioc
	./lower_ioc -o ioc_bad1_output data
ioc_test_bad1: 
	diff ioc_bad1_output output





clean:
	rm -f *.o
