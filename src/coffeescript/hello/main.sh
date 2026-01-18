#!/usr/bin/env bash

if [[ ! -f program.js ]]; then
	coffee -c program.coffee
fi

node program.js "$@"
