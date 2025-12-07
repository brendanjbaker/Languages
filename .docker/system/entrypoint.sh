#!/usr/bin/env bash

set -Eeuo pipefail

export PATH="/snap/bin:$PATH"

if [[ "${TEST:-false}" == "true" ]]; then
	if [[ ! -f "/tests/${PROGRAM:?}.bats" ]]; then
		echo "No test(s) defined for program \"${PROGRAM}\"."
		exit 1
	fi

	export TERM='xterm-256color'

	bats \
		--pretty \
		--timing \
		"/tests/${PROGRAM}.bats" 2>&1 3>&1
else
	if [[ "${DEBUG_PROGRAM:-false}" == "true" ]]; then
		exec bash -x /app/main.sh "$@"
	else
		exec bash /app/main.sh "$@"
	fi
fi
