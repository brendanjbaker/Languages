#!/usr/bin/env bash

if [[ ! -f program ]]; then
	futhark c -o program program.fut
fi

./program "$@" | sed 's/i32//g'
