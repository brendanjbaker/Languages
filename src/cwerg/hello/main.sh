#!/usr/bin/env bash

if [[ ! -f program.exe ]]; then
	declare cwerg_home='/opt/cwerg/6cb0415'
	declare cwerg_std_lib="$cwerg_home/FE/Lib"

	declare -a libraries=(
		"$cwerg_home/BE/StdLib/startup.x64.asm"
		"$cwerg_home/BE/StdLib/syscall.x64.asm"
		"$cwerg_home/BE/StdLib/std_lib.64.asm")

	cwc -stdlib "$cwerg_std_lib" 'program.cw' > 'program.asm'
	cwcg -mode 'binary' - 'program.exe' < <(cat "${libraries[@]}" 'program.asm')
	chmod +x 'program.exe'
fi

./program.exe "$@"
