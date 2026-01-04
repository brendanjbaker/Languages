#!/usr/bin/env bash

if [[ ! -f program ]]; then
	clojure -e "(compile 'program.core)"
fi

./program "$@"
