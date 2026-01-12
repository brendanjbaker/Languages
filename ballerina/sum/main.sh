#!/usr/bin/env bash

if [[ ! -f program.jar ]]; then
	bal build program.bal > /dev/null
fi

bal run program.jar "$@"
