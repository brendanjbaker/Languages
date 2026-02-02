#!/usr/bin/env bash

if [[ ! -f program ]]; then
	roc build program.roc > /dev/null
fi

./program "$@"
