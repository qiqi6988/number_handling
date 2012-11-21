#!/bin/sh

make -f makefile_gcc clean

make -f makefile_gcc 


make -f makefile_ioc clean

make -f makefile_ioc

make -f makefile_ioc_notrap clean

make -f makefile_ioc_notrap
