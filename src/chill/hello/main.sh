#!/usr/bin/env bash

if [[ ! -f program ]]; then
	chill-compile program.chl -o program.c
	gcc program.c -o program -lpthread
fi

./program "$@"
