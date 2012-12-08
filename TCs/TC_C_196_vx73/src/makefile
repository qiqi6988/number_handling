gcc: countlines.c istrlen.c
	gcc -o countlines_gcc  countlines.c istrlen.c

ioc: countlines.c istrlen.c
	clang -fioc-abort-on-error -fioc-explicit-conversion -fioc-implicit-conversion -fioc-unsigned -fioc-signed -fioc-shifts -fioc-strict-shifts -o countlines_ioc countlines.c istrlen.c

client_run_good1:
	chmod 777 jclient2
	./jclient2 -p 11423 -i 1.java
client_run_good2:
	chmod 777 jclient2
	./jclient2 -p 11423 -i 3.java
client_run_good3:
	chmod 777 jclient2
	./jclient2 -p 11423 -i 4.java
client_run_bad1:
	chmod 777 jclient2
	./jclient2 -p 11423 -i test_pcm_1.wav

gcc_run_good1:countlines_gcc
	./countlines_gcc -p 11423 -o gcc_run_good1

gcc_run_good2:countlines_gcc
	./countlines_gcc -p 11423 -o gcc_run_good2


gcc_run_good3:countlines_gcc
	./countlines_gcc -p 11423 -o gcc_run_good3

gcc_run_bad1:countlines_gcc
	./countlines_gcc -p 11423 -o gcc_run_bad1

ioc_run_good1:countlines_ioc
	./countlines_ioc -p 11423 -o ioc_run_good1

ioc_run_good2:countlines_ioc
	./countlines_ioc -p 11423 -o ioc_run_good2


ioc_run_good3:countlines_ioc
	./countlines_ioc -p 11423 -o ioc_run_good3

ioc_run_bad1:countlines_ioc
	./countlines_ioc -p 11423 -o ioc_run_bad1



clean:
	rm -f *.o
