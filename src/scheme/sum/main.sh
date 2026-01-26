#!/usr/bin/env bash

export GUILE_AUTO_COMPILE=0

if [[ ! -f program.go ]]; then
	guild compile program.scm --output=program.go > /dev/null
fi

guile -c '(load-compiled "program.go")'
