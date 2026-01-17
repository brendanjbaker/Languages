#!/usr/bin/env bash

if [[ ! -f program.elc ]]; then
	emacs --batch -f batch-byte-compile program.el 2> /dev/null
fi

emacs --batch --quick --load=program.elc "$@"
