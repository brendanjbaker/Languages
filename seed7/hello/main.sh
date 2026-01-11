#!/usr/bin/env bash

if [[ ! -f program ]]; then
	s7c program.sd7 > /dev/null
fi

./program "$@"
