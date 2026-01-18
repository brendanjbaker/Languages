#!/usr/bin/env bash

if [[ ! -f program ]]; then
	camlc -c program.ml
	camlc program.zo -o program
fi

./program "$@"
