gcc: cmdInterpreter.c query.c
	gcc -o cmdInterpreter_gcc  cmdInterpreter.c  query.c

ioc: cmdInterpreter.c query.c
	clang -fioc-abort-on-error -fioc-explicit-conversion -fioc-implicit-conversion -fioc-unsigned -fioc-signed -fioc-shifts -fioc-strict-shifts -o cmdInterpreter_ioc cmdInterpreter.c  query.c


gcc_run_good1: QUERY_STRING = cmd=6+in.txt+7+1+3+Good1_gcc.txt
gcc_run_good1: cmdInterpreter_gcc
	./cmdInterpreter_gcc
gcc_good1_check:
	diff Good1_gcc.txt cmdout1

gcc_run_good2: QUERY_STRING= cmd=6+in.txt+234+7+1+4+Good2_gcc.txt
gcc_run_good2:
	./cmdInterpreter_gcc
gcc_good2_check:
	diff Good2_gcc.txt cmdout3

gcc_run_bad1: QUERY_STRING= cmd=7+0+-10+Bad_gcc.txt
gcc_run_bad1:
	./cmdInterpreter_gcc
gcc_bad1_check:
	diff Bad_gcc.txt cmdout2

ioc_run_good1: QUERY_STRING= cmd=6+in.txt+7+1+3+Good1_ioc.txt
ioc_run_good1: cmdInterpreter_ioc
	./cmdInterpreter_ioc
ioc_good1_check:
	diff Good1_ioc.txt cmdout1

ioc_run_good2: QUERY_STRING= cmd=6+in.txt+234+7+1+4+Good2_ioc.txt
ioc_run_good2:
	./cmdInterpreter_ioc
ioc_good2_check:
	diff Good2_ioc.txt cmdout3

ioc_run_bad1: QUERY_STRING= cmd=7+0+-10+Bad_ioc.txt
ioc_run_bad1:
	./cmdInterpreter_ioc
	diff Bad_ioc.txt cmdout2
	



clean:
	rm -f *.o
