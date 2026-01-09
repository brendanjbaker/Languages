#!/usr/bin/env bash

if [[ ! -f program ]]; then
	icont -o program program.icn 2> /dev/null
fi

./program "$@"
