#!/usr/bin/env bash

if [[ ! -f _build/bin/program ]]; then
	deft build > /dev/null
fi

./_build/bin/program "$@"
