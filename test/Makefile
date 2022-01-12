#
#  Makefile
#
#  Copyright (c) 2022 by Daniel Kelley
#

.PHONY: all test clean

all: test

test: g.svg
	cmp g.dot g.dot.ref

g.dot: a.o b.o
	../bin/objgraph $+ > $@

g.svg: g.dot
	dot -Tsvg $< > $@

a.o:	a.c
b.o:	b.c

clean:
	-rm -f *.o *.dot *.svg
