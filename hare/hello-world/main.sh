#!/usr/bin/env bash

if [[ ! -f program ]]; then
	hare build -o program program.ha
fi

./program "$@"
