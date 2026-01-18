#!/usr/bin/env bash

set -Eeuo pipefail

export DEBUG="${DEBUG:-false}"
export DEBUG_CONTAINER="${DEBUG_CONTAINER:-false}"
export DEBUG_PROGRAM="${DEBUG_PROGRAM:-false}"
export DEBUG_SETUP="${DEBUG_SETUP:-false}"
export TEST="${TEST:-false}"

export PATH="/snap/bin:$PATH"

if [[ "${TEST:-false}" == "true" ]]; then
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
else
	if [[ "${DEBUG_PROGRAM:-false}" == "true" ]]; then
		bash -Eeuxo pipefail /app/main.sh "$@"
	else
		bash -Eeuo pipefail /app/main.sh "$@"
	fi
fi
