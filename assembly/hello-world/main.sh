#!/usr/bin/env bash

nasm -f elf64 program.asm -o program.o
ld program.o -o program
./program
