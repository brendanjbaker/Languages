#!/usr/bin/env bash

if [[ ! -f program ]]; then
	as -o program.o program.s
	ld -o program program.o
fi

./program "$@"
