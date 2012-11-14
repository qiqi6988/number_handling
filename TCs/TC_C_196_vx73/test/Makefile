# Generic STONESOUP makefile for C test case projects.
#
# Author: John D. Ramsdell (ramsdell)
# Date: 4/3/2012

# Place this in a directory such that the sources can be found via ../src.

CC = gcc -std=gnu99
CFLAGS = -g -O0

# The program name is derived from the project directory.
PROG := $(notdir $(shell cd ..; pwd))
# Use all the C sources and headers in the ../src directory
OBJS := $(notdir $(patsubst %.c,%.o,$(wildcard ../src/*.c)))
HDRS := $(notdir $(wildcard ../src/*.h))
# You can manually add other programs besides $(PROG) here.
PROGS = $(PROG)

VPATH = ../src

all:	$(PROGS)

clean:
	-rm $(PROGS) $(OBJS)

$(PROG):	$(OBJS)
	$(CC) $(LDFLAGS) -o $(PROG) $(OBJS) $(LDLIBS)

$(OBJS):	$(HDRS)
