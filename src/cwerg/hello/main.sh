#!/usr/bin/env bash

set -Eeuo pipefail

if [[ ! -f program.exe ]]; then
	declare cwerg_home='/opt/cwerg/f834ff3'

	cwerg \
		-stdlib "$cwerg_home/FE/Lib" program.cw \
		> 'program.ir'

	cat \
		"$cwerg_home/BE/StdLib/startup.x64.asm" \
		"$cwerg_home/BE/StdLib/syscall.x64.asm" \
		"$cwerg_home/BE/StdLib/std_lib.64.asm" \
		'program.ir' \
		> 'program.ir.combined'

	export PYTHONPATH="$cwerg_home"

	"$cwerg_home/BE/CodeGenX64/codegen.py" -mode binary - program.exe < 'program.ir.combined'
fi

./program.exe "$@"
