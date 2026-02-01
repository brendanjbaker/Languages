#!/usr/bin/env bash

if [[ ! -f PROGRAM.COM ]]; then
	uplm80 'PROGRAM.PLM' -o 'PROGRAM.MAC'
	um80 'PROGRAM.MAC' -o 'PROGRAM.REL'
	ul80 -o 'PROGRAM.COM' 'PROGRAM.REL'
	cp 'PROGRAM.COM' 'A/0/'
fi

runcpm > output <<- EOF
	PROGRAM
	EXIT
	EOF

cat output | grep '^Hello'
