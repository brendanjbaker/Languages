#!/usr/bin/env bash

export PATH="/snap/bin:$PATH"

if [[ ! -f program ]]; then
	zig build-exe program.zig
fi

./program "$@"
