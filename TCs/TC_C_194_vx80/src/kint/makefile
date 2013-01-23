kint: CountLinesServer.c
	kint-gcc -o kint  CountLinesServer.c
check:
	find . -name kint.ll  > bitcode.lst
	intglobal @bitcode.lst
	pintck
clean:
	rm *.ll *.ll.out kint  pintck.txt

