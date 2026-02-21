#!/usr/bin/env bash

if [[ ! -f program ]]; then
	vox program.vx
fi

./program "$@"
