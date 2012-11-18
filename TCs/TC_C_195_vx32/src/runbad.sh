#!/bin/sh
echo "Bad"
export QUERY_STRING="cmd=7+0+-10+../QKtest/Bad_gcc.txt"
echo "`./cmdInterpreter`"
