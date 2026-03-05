#!/usr/bin/env bash

if [[ ! -f program.bbc ]]; then
	bbcbasic > /dev/null <<- EOF
		LOAD program.bas
		SAVE program.bbc
		QUIT
		EOF
fi

bbcbasic -quit program.bbc "$@" \
| tr -d $'\x17' \
| tr -d $'\r'
