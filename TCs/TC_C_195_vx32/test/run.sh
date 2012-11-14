#!/bin/sh

set -x

: Good 1
: read from testData/in.txt, print 2 registers

QUERY_STRING="cmd=6+testData/in.txt+7+1+3+cmdout1"
test/TC_C_195_vx32

: Good 2
: dump output to cmdout3

QUERY_STRING="cmd=6+testData/in.txt+234+7+1+4+cmdout3"
test/TC_C_195_vx32

: Bad
: dump many registers until segfault, also dumping into cmdout2

QUERY_STRING="cmd=7+0+-10+cmdout2"
test/TC_C_195_vx32
