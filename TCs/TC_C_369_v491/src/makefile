gcc: machine.c
	gcc -o machine_gcc  machine.c 

ioc: machine.c
	clang -fioc-abort-on-error -fioc-explicit-conversion -fioc-implicit-conversion -fioc-unsigned -fioc-signed -fioc-shifts -fioc-strict-shifts -o machine_ioc machine.c 

ioc_notrap: machine.c
	clang  -fioc-explicit-conversion -fioc-implicit-conversion -fioc-unsigned -fioc-signed -fioc-shifts -fioc-strict-shifts -o machine_ioc_notrap machine.c 

gcc_run_good1: machine_gcc
	./machine_gcc program2

gcc_run_good2: machine_gcc
	./machine_gcc program3

gcc_run_bad1: machine_gcc
	./machine_gcc program1

gcc_run_bad2:machine_gcc
	./machine_gcc testfile

ioc_run_good1: machine_ioc
	./machine_ioc program2

ioc_run_good2: machine_ioc
	./machine_ioc program3


ioc_run_bad1: machine_ioc
	./machine_ioc program1

ioc_run_bad2:machine_gcc
	./machine_ioc testfile



clean:
	rm -f *.o
