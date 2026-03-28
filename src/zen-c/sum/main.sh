#!/usr/bin/env bash

if [[ ! -f program ]]; then
	zc program.zc > /dev/null
fi

./program "$@"
