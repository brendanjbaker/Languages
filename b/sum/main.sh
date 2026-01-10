#!/usr/bin/env bash

if [[ ! -f program ]]; then
	blang program.b -o program
fi

./program "$@"
