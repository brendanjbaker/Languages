#!/usr/bin/env bash

export PATH="/root/.local/share/ponyup/bin:$PATH"

if [[ ! -f program ]]; then
	ponyc --bin-name=program
fi

./program "$@"
