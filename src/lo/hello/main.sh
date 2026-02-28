#!/usr/bin/env bash

if [[ ! -f program.wasm ]]; then
	declare lo_home=$(echo /opt/lo/*)
	declare lo="$lo_home/lo.wasm"

	wasmtime --dir='.' "$lo" compile 'program.lo' > 'program.wasm'
fi

wasmtime program.wasm "$@"
