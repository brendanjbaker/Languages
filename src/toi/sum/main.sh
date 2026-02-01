#!/usr/bin/env bash

if [[ ! -f program.bytecode ]]; then
	python3 '/opt/toi/bd24614/src/lc/toil' program.ti program.bytecode > /dev/null 2>&1
fi

toi program.bytecode | tr -d '\0'
