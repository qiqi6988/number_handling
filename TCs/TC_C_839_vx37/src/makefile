gcc: main.c
	gcc -o main_gcc  main.c 

ioc: main.c
	clang -fioc-abort-on-error -fioc-explicit-conversion -fioc-implicit-conversion -fioc-unsigned -fioc-signed -fioc-shifts -fioc-strict-shifts -o main_ioc main.c 

ioc_notrap: main.c
	clang  -fioc-explicit-conversion -fioc-implicit-conversion -fioc-unsigned -fioc-signed -fioc-shifts -fioc-strict-shifts -o main_ioc_notrap main.c 

client_run_good1:jclient2
	./jclient2 -p 9084 -i test_pcm_good.wav

client_run_bad1: jclient2
	./jclient2 -p 9084 -i test_pcm_bad.wav

gcc_run_good1: main_gcc
	./main_gcc -o gcc_good1.wav

gcc_run_bad1: main_gcc
	./main_gcc -o gcc_bad1.wav

ioc_run_good1: main_ioc
	./main_ioc -o ioc_good1.wav

ioc_run_bad1: main_ioc
	./main_ioc -o ioc_bad1.wav

ioc_notrap_run_bad1:main_ioc_notrap
	./main_ioc_notrap -o  ioc_notrap_bad1.wav





clean:
	rm -f *.o
