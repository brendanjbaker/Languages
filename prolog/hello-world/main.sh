#!/usr/bin/env bash

if [[ ! -f program ]]; then
	swipl -o program -c program.pl 2> /dev/null
fi

./program "$@"
