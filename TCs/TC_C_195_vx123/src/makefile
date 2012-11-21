gcc: cmdInterreter

ioc: cmdInterreter_ioc

cmdInterreter_ioc: cmdInterpreter_ioc.o
	clang -o cmdInterpreter_ioc cmdInterpreter.o -fioc-abort-on-error -fioc-explicit-conversion -fioc-implicit-conversion -fioc-unsigned -fioc-signed -fioc-shifts -fioc-strict-shifts 
cmdInterpreter_ioc.o: cmdInterpreter.c
	clang -c cmdInterpreter.c -fioc-abort-on-error -fioc-explicit-conversion -fioc-implicit-conversion -fioc-unsigned -fioc-signed -fioc-shifts -fioc-strict-shifts

cmdInterreter: cmdInterpreter.o
	gcc -o cmdInterpreter cmdInterpreter.o
cmdInterpreter.o: cmdInterpreter.c
	gcc -c cmdInterpreter.c

gcc_run_good0:

ioc_run_good0:

gcc_run_good1:

ioc_run_good1:

gcc_run_bad0:

ioc_run_bad0: ioc
	./cmdInterpreter_ioc 7 0 -10 BadResult0.txt

clean: 
	rm -f *.o
