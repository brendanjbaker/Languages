#!/usr/bin/env bash

if [[ ! -f program.exe ]]; then
	declare cwerg_home='/opt/cwerg/f834ff3'
	declare cwerg_std_lib="$cwerg_home/FE/Lib"

	declare -a libraries=(
		"$cwerg_home/BE/StdLib/startup.x64.asm"
		"$cwerg_home/BE/StdLib/syscall.x64.asm"
		"$cwerg_home/BE/StdLib/std_lib.64.asm")

	export PYTHONPATH="$cwerg_home"
	export PYPY='python3'

	cwerg-c -stdlib "$cwerg_std_lib" -shake_tree -arch x64 program.cw > program.asm
	cwerg-gen -mode binary - program.exe < <(cat "${libraries[@]}" program.asm)
fi

./program.exe "$@"
