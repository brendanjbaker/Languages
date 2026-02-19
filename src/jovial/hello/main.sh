#!/usr/bin/env bash

if [[ ! -f PROGRAM ]]; then
	jovialc PROGRAM.JOV -f exe 2> /dev/null
fi

./PROGRAM "$@"
