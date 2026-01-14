#!/usr/bin/env bash

if [[ ! -f elm.js ]]; then
	elm make Program.elm --optimize --output=program.js > /dev/null
fi

node run.js "$@" 2> /dev/null
