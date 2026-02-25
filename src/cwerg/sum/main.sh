#!/usr/bin/env bash

if [[ ! -f program.exe ]]; then
	cwc program.cw program.exe
fi

./program.exe "$@"
