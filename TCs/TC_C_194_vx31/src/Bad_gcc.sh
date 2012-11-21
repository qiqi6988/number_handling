#!/bin/sh
echo "Bad for gcc"
export QUERY_STRING="filename=2.java&length=90"
echo "`./countlines`"
