#!/usr/bin/env bash

if [[ ! -f program ]]; then
	# Option "o": Output filename.
	# Option "O": Enable optimization; otherwise compiler complains.
	# Option "x": Create an executable program (instead of a library).
	cobc -o program -O -x program.cob
fi

./program
