gcc: unihan.c oneshotsrv.c
	gcc -o unihan_gcc  unihan.c  oneshotsrv.c

ioc: unihan.c oneshotsrv.c
	clang -fioc-abort-on-error -fioc-explicit-conversion -fioc-implicit-conversion -fioc-unsigned -fioc-signed -fioc-shifts -fioc-strict-shifts -o unihan_ioc unihan.c  oneshotsrv.c

ioc_notrap: unihan.c oneshotsrv.c
	clang  -fioc-explicit-conversion -fioc-implicit-conversion -fioc-unsigned -fioc-signed -fioc-shifts -fioc-strict-shifts -o unihan_ioc_notrap unihan.c oneshotsrv.c

gcc_run: unihan_gcc
	./unihan_gcc 8888
ioc_run:unihan_ioc
	./unihan_ioc 8888
client_run_good1: sendfile
	chmod 777 sendfile
	./sendfile 8888 other_le.txt
client_run_good2: sendfile
	chmod 777 sendfile
	./sendfile 8888 other_be.txt
client_run_bad1: sendfile
	chmod 777 sendfile
	./sendfile 8888 root_be.txt

gcc_check_good1: 
	diff other_leOut.bin ../testOutput/other_leOut.bin
gcc_check_good2:
	diff other_beOut.bin ../testOutput/other_beOut.bin
gcc_check_bad1:
	diff root_beOut.bin ../testOutput/root_beOut.bin
ioc_check_good1: 
	diff other_leOut.bin ../testOutput/other_leOut.bin
ioc_check_good2:
	diff other_beOut.bin ../testOutput/other_beOut.bin
ioc_check_bad1:
	diff root_beOut.bin ../testOutput/root_beOut.bin






clean:
	rm -f *.o
