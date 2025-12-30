#!/usr/bin/env bash

if [[ ! -f program.go ]]; then
	guild compile program.scm --output=program.go > /dev/null
fi

guile --no-auto-compile -c '(load-compiled "program.go")'
