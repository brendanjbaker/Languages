#!/usr/bin/env bash

if [[ ! -f program.js ]]; then
	wenyan --compile --output program.js program.wy
fi

node program.js "$@"
