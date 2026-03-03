#!/usr/bin/env bash

if [[ ! -f program ]]; then
	hylo program.hylo -o program
fi

./program "$@"
