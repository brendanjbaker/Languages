#!/usr/bin/env bash

if [[ ! -f program ]]; then
	qc-- 'program.c--' -o program
fi

./program "$@"
