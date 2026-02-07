#!/usr/bin/env bash

if [[ ! -f program ]]; then
	# Does it have to be named "main.elk"?
	elk compile program.elk
fi

./program "$@"
