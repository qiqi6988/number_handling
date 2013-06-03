kint: lower.c query.c
	kint-gcc -o kint  lower.c  query.c
check:
	find . -name kint.ll  > bitcode.lst
	intglobal @bitcode.lst
	pintck
clean:
	rm *.ll *.ll.out kint  pintck.txt
