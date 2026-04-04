#!/usr/bin/env bash

if [[ ! -f program.xsc ]]; then
	xs build 'program.xs' -o 'program.xsc' 2> /dev/null
fi

xs run 'program.xsc' "$@"
