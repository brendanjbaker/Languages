#!/usr/bin/env bash

if [[ ! -f program ]]; then
	zig build-exe program.zig
fi

./program "$@"
