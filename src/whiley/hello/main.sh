#!/usr/bin/env bash

if [[ ! -d bin ]]; then
	wy build
fi

wy run "$@"
