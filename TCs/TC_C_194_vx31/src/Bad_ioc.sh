#!/bin/sh
echo "Bad for ioc"
export QUERY_STRING="filename=2.java&length=90"
echo "`./countlines_ioc`"


