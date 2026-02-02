#!/usr/bin/env bash

if [[ ! -f bin/program ]]; then
	alr build > /dev/null
	gnatprove > /dev/null
fi

./bin/program "$@"
