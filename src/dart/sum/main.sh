#!/usr/bin/env bash

if [[ ! -f program ]]; then
	dart compile exe program.dart -o program > /dev/null
fi

./program "$@"
