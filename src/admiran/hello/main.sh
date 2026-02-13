#!/usr/bin/env bash

if [[ ! -f program ]]; then
	amc program.am > /dev/null
fi

./program "$@"
