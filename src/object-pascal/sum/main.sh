#!/usr/bin/env bash

if [[ ! -f program ]]; then
	fpc program.pas > /dev/null
fi

./program "$@"
