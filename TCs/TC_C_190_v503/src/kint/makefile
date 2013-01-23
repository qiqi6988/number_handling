kint: countlines.c
	kint-gcc -o kint  countlines.c
check:
	find . -name kint.ll  > bitcode.lst
	intglobal @bitcode.lst
	pintck
clean:
	rm *.ll *.ll.out kint  pintck.txt
