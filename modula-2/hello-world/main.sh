#!/usr/bin/env bash

if [[ ! -f program ]]; then
	gm2 -o program program.mod
fi

./program "$@"
