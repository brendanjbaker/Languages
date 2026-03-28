#!/usr/bin/env bash

if [[ ! -f program ]]; then
	oni program.oni -o program.c
	cc program.c -o program
fi

./program "$@"
