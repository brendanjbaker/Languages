#!/usr/bin/env bash

if [[ ! -f program ]]; then
	# Option "o": Output filename.
	rustc program.rs -o program
fi

./program "$@"
