#!/usr/bin/env bash

if [[ ! -f program ]]; then
	ghc program.hs -o program > /dev/null
fi

./program "$@"
