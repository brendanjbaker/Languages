#!/usr/bin/env bash

if [[ ! -f "/tests/${PROGRAM:?}.bats" ]]; then
	echo "No test(s) defined for program \"${PROGRAM}\"."
	exit 1
fi

export TERM='xterm-256color'

# "Prime" the program before running test(s).
/app/main.sh > /dev/null 2>&1 || true

if [[ "${DEBUG:-false}" == "true" ]]; then
	set -x
fi

bats \
	--formatter tap \
	--print-output-on-failure \
	--timing \
	"/tests/${PROGRAM}.bats"
