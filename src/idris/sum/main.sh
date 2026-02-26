#!/usr/bin/env bash

if [[ ! -f build/exec/Program ]]; then
	idris2 Program.idr -o Program
fi

./build/exec/Program "$@"
