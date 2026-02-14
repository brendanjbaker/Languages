#!/usr/bin/env bash

if [[ ! -f program ]]; then
	hcc program.HC -o program
fi

./program "$@"
