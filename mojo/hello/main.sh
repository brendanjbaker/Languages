#!/usr/bin/env bash

if [[ ! -f program ]]; then
	pixi run mojo build program.mojo 2> /dev/null
fi

./program "$@"
