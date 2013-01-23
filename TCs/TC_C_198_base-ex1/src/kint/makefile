kint: unihan.c
	kint-gcc -o kint  unihan.c 
check:
	find . -name kint.ll  > bitcode.lst
	intglobal @bitcode.lst
	pintck
clean:
	rm *.ll *.ll.out kint  pintck.txt

