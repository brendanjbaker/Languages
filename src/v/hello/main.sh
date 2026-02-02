#!/usr/bin/env bash

if [[ ! -f program ]]; then
	v program.v
fi

./program "$@"
