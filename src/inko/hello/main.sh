#!/usr/bin/env bash

if [[ ! -f build/debug/program ]]; then
	inko build program.inko
fi

./build/debug/program "$@"
