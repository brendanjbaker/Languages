#!/usr/bin/env bash

if [[ ! -f program ]]; then
	valac program.vala -o program
fi

./program "$@"
