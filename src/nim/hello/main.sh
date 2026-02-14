#!/usr/bin/env bash

if [[ ! -f program ]]; then
	nim compile program.nim 2> /dev/null
fi

./program "$@"
