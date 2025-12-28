#!/usr/bin/env bash

if [[ ! -f program ]]; then
	chpl -o program program.chpl
fi

./program "$@"
