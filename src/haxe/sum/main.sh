#!/usr/bin/env bash

if [[ ! -f program.n ]]; then
	haxe --main Program --neko program.n
fi

neko program.n "$@"
