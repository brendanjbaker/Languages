#!/usr/bin/env bash

if [[ ! -f program.lua ]]; then
	export ERDE_ROOT=$(echo /opt/erde/*)
	export LUA_PATH="$ERDE_ROOT/?.lua;$ERDE_ROOT/?/init.lua;${LUA_PATH:-}"

	declare erde_cli="$ERDE_ROOT/erde/cli.lua"

	lua "$erde_cli" compile program.erde > /dev/null
fi

lua program.lua "$@"
