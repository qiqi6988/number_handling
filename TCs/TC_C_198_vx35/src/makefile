gcc: unihan.c 
	gcc -o unihan_gcc  unihan.c  

ioc: unihan.c 
	clang -fioc-abort-on-error -fioc-explicit-conversion -fioc-implicit-conversion -fioc-unsigned -fioc-signed -fioc-shifts -fioc-strict-shifts -o unihan_ioc unihan.c  

ioc_notrap: unihan.c 
	clang  -fioc-explicit-conversion -fioc-implicit-conversion -fioc-unsigned -fioc-signed -fioc-shifts -fioc-strict-shifts -o unihan_ioc_notrap unihan.c 

ioc_notrap_run_bad1:unihan_ioc_notrap
	./unihan_ioc_notrap root_be.txt
gcc_run_good1: CONTENT_LENGTH = 12
gcc_run_good1: unihan_gcc
	./unihan_gcc  other_be.txt

gcc_run_good2: CONTENT_LENGTH = 12
gcc_run_good2: unihan_gcc
	./unihan_gcc  other_le.txt

gcc_run_bad1: CONTENT_LENGTH = 10
gcc_run_bad1: unihan_gcc
	./unihan_gcc root_be.txt

gcc_run_bad2: CONTENT_LENGTH = 10
gcc_run_bad2: unihan_gcc
	./unihan_gcc root_le.txt

ioc_run_good1: CONTENT_LENGTH = 12
ioc_run_good1: unihan_ioc
	./unihan_ioc  other_be.txt

ioc_run_good2: CONTENT_LENGTH = 12
ioc_run_good2: unihan_ioc
	./unihan_ioc  other_le.txt

ioc_run_bad1: CONTENT_LENGTH = 10
ioc_run_bad1: unihan_ioc
	./unihan_ioc root_be.txt

ioc_run_bad2: CONTENT_LENGTH = 10
ioc_run_bad2: unihan_ioc
	./unihan_ioc root_le.txt

clean:
	rm -f *.o
