#!/bin/sh
echo "Bad"
export QUERY_STRING="cmd=7+0+-10+../QKtest/Bad_ioc_notrap.txt"
echo "`./cmdInterpreter_ioc_notrap`"
