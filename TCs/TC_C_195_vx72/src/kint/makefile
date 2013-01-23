kint: recaman.c oneshotsrv.c
	kint-gcc -o kint  recaman.c  oneshotsrv.c
check:
	find . -name kint.ll  > bitcode.lst
	intglobal @bitcode.lst
	pintck
clean:
	rm *.ll *.ll.out kint  pintck.txt

