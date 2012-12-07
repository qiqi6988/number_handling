gcc: main.c
	gcc -o main_gcc  main.c 

ioc: main.c
	clang -fioc-abort-on-error -fioc-explicit-conversion -fioc-implicit-conversion -fioc-unsigned -fioc-signed -fioc-shifts -fioc-strict-shifts -o main_ioc main.c 

ioc_notrap: main.c
	clang  -fioc-explicit-conversion -fioc-implicit-conversion -fioc-unsigned -fioc-signed -fioc-shifts -fioc-strict-shifts -o main_ioc_notrap main.c 

client_good1:jclient
	chmod 777 jclient
	./jclient test_pcm_good.wav

client_bad1:jclient
	chmod 777 jclient
	./jclient test_pcm_bad.wav

gcc_run_good1: main_gcc
	./main_gcc -o out_pcm1_gcc_test.wav

gcc_good1_check:
	diff out_pcm1_gcc_test.wav out_pcm_1.wav

gcc_run_bad1: main_gcc
	./main_gcc -o out_pcm2_gcc_test.wav

gcc_bad1_check:		
	diff out_pcm2_gcc_test.wav out_pcm_2.wav

ioc_run_good1: main_ioc
	./main_ioc -o out_pcm1_ioc_test.wav

ioc_good1_check:
	diff out_pcm1_ioc_test.wav out_pcm_1.wav

ioc_run_bad1: main_ioc
	./main_ioc -o out_pcm2_ioc_test.wav
ioc_bad1_check:
	diff out_pcm2_ioc_test.wav out_pcm_2.wav

ioc_notrap_run_bad1: main_ioc
	./main_ioc_notrap -o ioc_notrap_bad.wav

clean:
	rm -f *.o
