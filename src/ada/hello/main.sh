#!/usr/bin/env bash

if [[ ! -f program ]]; then
	gnatmake program.adb -o program 2> /dev/null
fi

./program "$@"
