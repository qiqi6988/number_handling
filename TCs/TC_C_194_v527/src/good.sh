#!/bin/sh

echo "Good1 for GCC"
echo "`./countlines 1.java 70`"

echo "Good2 for GCC"
echo "`./countlines 2.java 120`"


echo "Good1 for IOC"
echo "`./countlines_ioc 1.java 70`"

echo "Good2 for IOC"
echo "`./countlines_ioc 2.java 120`"
