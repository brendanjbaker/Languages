#!/usr/bin/env bash

if [[ ! -f program ]]; then
	fpc -Mdelphi program.pas > /dev/null
fi

./program "$@"
