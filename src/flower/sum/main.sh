#!/usr/bin/env bash

if [[ ! -f program ]]; then
	flower program.flo program > /dev/null
fi

./program "$@"
