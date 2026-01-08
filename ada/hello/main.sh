#!/usr/bin/env bash

if [[ ! -f program ]]; then
	gnatmake program.adb -o program
fi

./program "$@"
