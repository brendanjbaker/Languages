#!/usr/bin/env bash

if [[ ! -f program ]]; then
	gcc -o program program.m -lobjc
fi

./program
