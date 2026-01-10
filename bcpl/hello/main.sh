#!/usr/bin/env bash

if [[ ! -f program ]]; then
	bcpl program.b -o program
fi

./program "$@"
