gcc: head.c
	gcc -o head_gcc  head.c 

ioc: head.c
	clang -fioc-abort-on-error -fioc-explicit-conversion -fioc-implicit-conversion -fioc-unsigned -fioc-signed -fioc-shifts -fioc-strict-shifts -o head_ioc head.c 

ioc_notrap: head.c
	clang  -fioc-explicit-conversion -fioc-implicit-conversion -fioc-unsigned -fioc-signed -fioc-shifts -fioc-strict-shifts -o head_ioc_notrap head.c 

gcc_run_good1: head_gcc
	./head_gcc input1.txt

gcc_run_good2: head_gcc
	./head_gcc -n 20 input1.txt

gcc_run_bad1: head_gcc
	./head_gcc -n -1 input2.txt

ioc_run_good1: head_ioc
	./head_ioc input1.txt

ioc_run_good2: head_ioc
	./head_ioc -n 20 input1.txt


ioc_run_bad1: head_ioc
	./head_ioc -n -1 input2.txt



clean:
	rm -f *.o
