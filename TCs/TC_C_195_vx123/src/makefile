gcc: cmdInterpreter
	gcc -o cmdInterpreter_gcc  cmdInterpreter.c

ioc: cmdInterpreter.c 
	clang -fioc-abort-on-error -fioc-explicit-conversion -fioc-implicit-conversion -fioc-unsigned -fioc-signed -fioc-shifts -fioc-strict-shifts -o cmdInterpreter_ioc cmdInterpreter.c 




gcc_run_good1:cmdInterpreter_gcc
	./cmdInterpreter_gcc  7 0 9 gcc_good1.txt
gcc_good1_check:
	diff gcc_good1.txt ../testOutput/GoodRun1.txt

gcc_run_good2:cmdInterpreter_gcc
	./cmdInterpreter_gcc  6 in.txt 201 312 423 510 520 530 7 0 9 gcc_good2.txt
gcc_good2_check:
	diff gcc_good2.txt ../testOutput/GoodRun2.txt

gcc_run_bad1: cmdInterpreter_gcc
	./cmdInterpreter_gcc  7 0 -10 gcc_bad1.txt

gcc_bad1_check:
	diff gcc_bad1.txt ../testOutput/BadRun1.txt	

	
ioc_run_good1:cmdInterpreter_ioc
	./cmdInterpreter_ioc  7 0 9 ioc_good1.txt
ioc_good1_check:
	diff ioc_good1.txt ../testOutput/GoodRun1.txt

ioc_run_good2:cmdInterpreter_ioc
	./cmdInterpreter_ioc  6 in.txt 201 312 423 510 520 530 7 0 9 ioc_good2.txt
ioc_good2_check:
	diff ioc_good2.txt ../testOutput/GoodRun2.txt

ioc_run_bad1: cmdInterpreter_gcc
	./cmdInterpreter_ioc  7 0 -10 ioc_bad1.txt

ioc_bad1_check:
	diff ioc_bad1.txt ../testOutput/BadRun1.txt


clean:
	rm -f *.o
