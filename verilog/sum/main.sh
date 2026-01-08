#!/usr/bin/env bash

if [[ ! -f program ]]; then
	iverilog -o program program.v
fi

vvp program "$@" | grep -Fv "\$finish called"
