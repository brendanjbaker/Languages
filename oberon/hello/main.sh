#!/usr/bin/env bash

if [[ ! -f Program ]]; then
	obnc Program.Mod
fi

./Program "$@"
