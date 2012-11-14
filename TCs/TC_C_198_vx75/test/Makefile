# Generic STONESOUP makefile for C test case projects.
#
# Author: John D. Ramsdell (ramsdell)
# Date: 3/20/2012

CC = gcc -std=gnu99
CFLAGS = -g -O0 -Wall

# The program name is derived from the project directory.
# PROG := $(notdir $(shell cd ..; pwd))
PROG = unihan
# Use all the C sources and headers in the ../src directory
OBJS := $(notdir $(patsubst %.c,%.o,$(wildcard ../src/*.c)))
HDRS := $(notdir $(wildcard ../src/*.h))
# You can manually add other programs besides $(PROG) here.
PROGS = $(PROG) sendfile

VPATH = ../src

all:	$(PROGS)

clean:
	-rm $(PROGS) $(OBJS)

$(PROG):	$(OBJS)
	$(CC) $(LDFLAGS) -o $(PROG) $(OBJS) $(LDLIBS)

$(OBJS):	$(HDRS)
