#!/usr/bin/env bash

export XDG_RUNTIME_DIR=~
export WINEPREFIX=$HOME/.wine32
export WINEARCH=win32
export WINEDEBUG=-all

if [[ ! -f program.exe ]]; then
	declare nemerle_home='/opt/nemerle/1.2.0.547'
	declare ncc="$nemerle_home/ncc.exe"

	wine "$ncc" -out:program program.n
fi

wine program.exe "$@" | tr -d '\r'
