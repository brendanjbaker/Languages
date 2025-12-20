#!/usr/bin/env bash

echo "ENTRYPOINT"

set -Eeuo pipefail

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
		--timing \
		"/tests/${PROGRAM}.bats"

	result=$?

	echo "Test result: $result"
else
	if [[ "${DEBUG_PROGRAM:-false}" == "true" ]]; then
		bash -x /app/main.sh "$@"
	else
		bash /app/main.sh "$@"
	fi
fi
