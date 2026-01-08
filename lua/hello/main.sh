#!/usr/bin/env bash

if [[ ! -f program.luac ]]; then
	luac -o program.luac program.lua
fi

lua program.luac
