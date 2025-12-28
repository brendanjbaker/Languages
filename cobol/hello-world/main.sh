#!/usr/bin/env bash

if [[ ! -f program ]]; then
	# Option "o": Output filename.
	# Option "O": Enable optimization; otherwise compiler complains.
	# Option "x": Create an executable program (instead of a library).
	cobc -o program -O -x program.cob
fi

# Hide the warning 'Warning: program compiled against libxml 212 using older 209'.
# Happens on Debian 13, but not 12. Wasn't successfully at manually installing 209.
./program "$@" 2> >(grep -v 'libxml 212' >&2)
