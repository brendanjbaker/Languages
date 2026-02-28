#!/usr/bin/env bash

if [[ ! -f program ]]; then
	tx0 -c -s 'program' 'program'
fi

./program "$@"
