gcc: recaman.c 
	gcc -o recaman_gcc  recaman.c  

ioc: recaman.c 
	clang -o recaman_ioc -fioc-abort-on-error -fioc-explicit-conversion -fioc-implicit-conversion -fioc-unsigned -fioc-shifts -fioc-strict-shifts  recaman.c  
#clang -fioc-abort-on-error -fioc-explicit-conversion -fioc-implicit-conversion -fioc-unsigned -fioc-signed -fioc-shifts -fioc-strict-shifts -o recaman_ioc recaman.c  




gcc_run_good1: recaman_gcc
	./recaman_gcc 6

ioc_run_good1:recaman_ioc
	./recaman_ioc 6

gcc_run_good2: recaman_gcc
	./recaman_gcc -2

ioc_run_good2:recaman_ioc
	./recaman_ioc -2



gcc_run_bad1: recaman_gcc
	./recaman_gcc -6

ioc_run_bad1:recaman_ioc
	./recaman_ioc -6



gcc_run_bad2: recaman_gcc
	./recaman_gcc 87313

ioc_run_bad2:recaman_ioc
	./recaman_ioc 87313



clean:
	rm -f *.o
