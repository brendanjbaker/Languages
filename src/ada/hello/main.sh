#!/usr/bin/env bash

if [[ ! -f program ]]; then
	gnatmake -gnat2022 program.adb -o program 2> /dev/null
fi

./program "$@"
