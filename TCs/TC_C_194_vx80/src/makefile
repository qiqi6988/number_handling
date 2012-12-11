gcc: CountLinesServer.c 
	gcc -o CountLinesServer_gcc  CountLinesServer.c  

ioc: CountLinesServer.c 
	clang -fioc-abort-on-error -fioc-explicit-conversion -fioc-implicit-conversion -fioc-unsigned -fioc-signed -fioc-shifts -fioc-strict-shifts -o CountLinesServer_ioc CountLinesServer.c  


gcc_run: CountLinesServer_gcc
	./CountLinesServer_gcc 9876


ioc_run:CountLinesServer_ioc
	./CountLinesServer_ioc 9876

client_run_good1: client
	chmod 777 client
	./client 9876 1.java 70

client_run_good2: client
	chmod 777 client
	./client 9876 2.java 120

client_run_bad1: client
	./client 9876 2b.java 90

client_run_bad2: client
	./client 9876 2.java 90



clean:
	rm -f *.o
