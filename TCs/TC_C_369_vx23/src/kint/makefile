kint: mainserver.c query.c
	kint-gcc -o kint  mainserver.c  query.c
check:
	find . -name kint.ll  > bitcode.lst
	intglobal @bitcode.lst
	pintck
clean:
	rm *.ll *.ll.out kint  pintck.txt

