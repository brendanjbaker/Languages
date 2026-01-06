#!/usr/bin/env bash

if [[ ! -f program ]]; then
	a68g --compile program.a68 --keep
fi

export LD_LIBRARY_PATH="/app"

./program "$@"
