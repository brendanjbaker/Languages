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
		--formatter tap \
		--timing \
		"/tests/${PROGRAM}.bats"
else
	if [[ "${DEBUG_PROGRAM:-false}" == "true" ]]; then
		exec bash -x /app/main.sh "$@"
	else
		exec bash /app/main.sh "$@"
	fi
fi
