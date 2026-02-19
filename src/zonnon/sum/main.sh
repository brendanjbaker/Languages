#!/usr/bin/env bash

if [[ ! -f program.exe ]]; then
	mono "$(readlink "$(which zc)")" /entry:Program 'program.znn' > /dev/null
fi

mono program.exe "$@"
