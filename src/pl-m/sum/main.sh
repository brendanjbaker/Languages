#!/usr/bin/env bash

if [[ ! -f PROGRAM.COM ]]; then
	uplm80 'PROGRAM.PLM' -o 'PROGRAM.MAC' > /dev/null
	um80 'PROGRAM.MAC' -o 'PROGRAM.REL' > /dev/null
	ul80 -o 'PROGRAM.COM' 'PROGRAM.REL' > /dev/null
	cp 'PROGRAM.COM' 'A/0/'
fi

export TERM='xterm'

runcpm > output <<- EOF
	PROGRAM
	EXIT
	EOF

cat output | grep '^[0-9]\+$'
