gcc: recaman.c oneshotsrv.c
	gcc -o server_gcc  recaman.c  oneshotsrv.c

ioc: recaman.c oneshotsrv.c
	clang -fioc-abort-on-error -fioc-explicit-conversion -fioc-implicit-conversion -fioc-unsigned -fioc-signed -fioc-shifts -fioc-strict-shifts -o server_ioc recaman.c  oneshotsrv.c




gcc_run:server_gcc
	./server_gcc 8989
gcc_good_check:
	diff 22Out.bin ../testOutput/22Out.bin
gcc_bad_check:
	diff 9Out.bin ../testOutput/9Out.bin


ioc_run: server_ioc
	./server_ioc 8989
ioc_good_check:
	diff 22Out.bin ../testOutput/22Out.bin
ioc_bad_check:
	diff 9Out.bin ../testOutput/2Out.bin

client_run_good:oneshotclt
	chmod 777 oneshotclt
	./oneshotclt -- 8989 22

client_run_bad: oneshotclt
	chmod 777 oneshotclt
	./oneshotclt -- 8989 -9
	

	



clean:
	rm -f *.o
