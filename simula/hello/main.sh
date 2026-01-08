#!/usr/bin/env bash

if [[ ! -f program ]]; then
	cim --cflags="-g -O2 -std=gnu89 -Wno-implicit-function-declaration -Wno-implicit-int -include stdlib.h" program.sim > /dev/null
fi

./program "$@"
