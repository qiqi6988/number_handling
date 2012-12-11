gcc: server.c 
	gcc -o server_gcc  server.c 

ioc: server.c 
	clang -fioc-abort-on-error -fioc-explicit-conversion -fioc-implicit-conversion -fioc-unsigned -fioc-signed -fioc-shifts -fioc-strict-shifts -o server_ioc server.c 

ioc_notrap: server.c 
	clang  -fioc-explicit-conversion -fioc-implicit-conversion -fioc-unsigned -fioc-signed -fioc-shifts -fioc-strict-shifts -o server_ioc_notrap server.c 

run_good1_client: client
	./client  slope in file 1


run_good2_client:client
	./client  slope in file 2


run_good3_client: client
	./client slope in file 3


run_bad1_client:client
	./client  slope in file 4

gcc_run: server_gcc
	./server_gcc 


ioc_run:server_ioc
	./server_ioc




clean:
	rm -f *.o
