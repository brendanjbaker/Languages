#!/usr/bin/env bash

if [[ ! -f program ]]; then
	gpt -o program program.gpt
fi

./program "$@"
