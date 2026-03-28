#!/usr/bin/env bash

if [[ ! -f program ]]; then
	llc -filetype=obj -o 'program.o' 'program.ll'
	ld -e 'main' -o 'program' 'program.o'
fi

./program "$@"
