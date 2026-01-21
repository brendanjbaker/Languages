#!/usr/bin/env bash

if [[ ! -f program ]]; then
	zig build-exe program.zig 2> /dev/null
fi

./program "$@"
