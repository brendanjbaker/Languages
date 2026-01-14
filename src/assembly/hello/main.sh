#!/usr/bin/env bash

if [[ ! -f program ]]; then
	nasm -f elf64 program.asm -o program.o
	ld program.o -o program
fi

./program "$@"
