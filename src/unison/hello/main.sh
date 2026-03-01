#!/usr/bin/env bash

if [[ ! -f program.uc ]]; then
	ucm > /dev/null 2>&1 <<- EOF
		load program.u
		update
		compile main program
		EOF
fi

ucm run.compiled program.uc -- "$@"
