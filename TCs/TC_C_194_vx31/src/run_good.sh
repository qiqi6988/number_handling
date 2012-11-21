#!/bin/sh

echo "Good1 for gcc"
export QUERY_STRING="filename=1.java&length=70"
echo "`./countlines`"

echo "Good2 for gcc"
export QUERY_STRING="filename=2.java&length=120"
echo "`./countlines`"

echo "Good3 for gcc"
export QUERY_STRING="filename=long.java&length=257"
echo "`./countlines`"


echo "Good1 for ioc"
export QUERY_STRING="filename=1.java&length=70"
echo "`./countlines_ioc`"

echo "Good2 for ioc"
export QUERY_STRING="filename=2.java&length=120"
echo "`./countlines_ioc`"

echo "Good3 for ioc"
export QUERY_STRING="filename=long.java&length=257"
echo "`./countlines_ioc`"



