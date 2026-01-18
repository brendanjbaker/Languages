#!/usr/bin/env bash

if [[ ! -d build ]]; then
	gleam build 2> /dev/null
fi

gleam run --no-print-progress "$@"
