#!/usr/bin/env bash

if [[ ! -f program ]]; then
	flintc --file program.ft --out program > /dev/null
fi

./program "$@"
