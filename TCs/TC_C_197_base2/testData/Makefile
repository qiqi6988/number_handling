# Stonesoup makefile.

PROG = lower
OBJS = lower.o
HDRS =

CC = gcc -std=gnu99
CFLAGS = -g -O0 -Wall

# No changes should be necessary below this line.

VPATH = ../src

all:	$(PROG)

clean:
	-rm $(PROG) $(OBJS)

$(PROG):	$(OBJS)
	$(CC) $(LDFLAGS) -o $(PROG) $(OBJS) $(LDLIBS)

$(OBJS):	$(HDRS)
