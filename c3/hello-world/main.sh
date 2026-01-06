#!/usr/bin/env bash

if [[ ! -f build/program ]]; then
	c3c test > /dev/null
	c3c build > /dev/null
fi

./build/program "$@"
