#!/usr/bin/env bash

if [[ ! -f program ]]; then
	ocamlc -o program program.ml
fi

./program "$@"
