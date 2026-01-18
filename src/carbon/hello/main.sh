#!/usr/bin/env bash

if [[ ! -f program ]]; then
	carbon compile --output=program.o program.carbon
	carbon link --output=program program.o
fi

./program "$@"
