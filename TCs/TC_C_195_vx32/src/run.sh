#!/bin/sh

echo "Good1"
export QUERY_STRING="cmd=6+../testData/in.txt+7+1+3+../QKtest/Good_gcc.txt"
echo "`./cmdInterpreter`"

echo "Good2"
export QUERY_STRING="cmd=6+../testData/in.txt+234+7+1+4+../QKtest/Good2_gcc.txt"
echo "`./cmdInterpreter`"

