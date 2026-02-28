#!/usr/bin/env bash

if [[ ! -f program ]]; then
	odin build 'program.odin' -file
fi

./program "$@"
