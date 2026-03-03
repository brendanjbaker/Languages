#!/usr/bin/env bash

if [[ ! -f program ]]; then
	hc program.hylo -o program
fi

./program "$@"
