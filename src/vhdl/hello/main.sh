#!/usr/bin/env bash

if [[ ! -f program ]]; then
	export GHDL_BACKEND=llvm

	ghdl analyze program.vhdl
	ghdl make program > /dev/null
fi

./program "$@"
