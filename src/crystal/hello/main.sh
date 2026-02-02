#!/usr/bin/env bash

if [[ ! -f program ]]; then
	crystal build program.cr
fi

./program "$@"
