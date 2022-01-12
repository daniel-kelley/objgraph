#
#  Makefile
#
#  Copyright (c) 2022 by Daniel Kelley
#

PREFIX ?= /usr/local

.PHONY: all check clean

all:
	@echo "targets: check install  clean"

check:
	make -C test

clean:
	make -C test clean

