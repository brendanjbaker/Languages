#!/usr/bin/env bash

if [[ ! -f program ]]; then
	bcplc -O program.bcpl -o program 2> /dev/null
fi

./program "$@"
