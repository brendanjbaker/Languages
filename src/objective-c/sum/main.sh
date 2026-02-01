#!/usr/bin/env bash

if [[ ! -f program ]]; then
	gcc -o program program.m -lobjc -std=c99
fi

./program "$@"
