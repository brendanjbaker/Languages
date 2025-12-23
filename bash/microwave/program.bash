#!/usr/bin/env bash

set -Eeuo pipefail

function is_numeric {
	echo -n "$1" | grep -Eq '^[0-9]+$'
}

function main {
	if [[ $# -ne 1 ]]; then
		exit 1
	fi

	local input="$1"

	if [[ "${#input}" -lt 1 || "${#input}" -gt 4 ]]; then
		exit 2
	fi

	if ! is_numeric "$input"; then
		exit 2
	fi

	local input_fixed=$(printf '%04d' "$input")
	local input_minutes="${input_fixed:0:2}"
	local input_seconds="${input_fixed:2:2}"

	if (( 10#$input_seconds >= 60 )); then
		if (( 10#$input_minutes < 99 )); then
			input_minutes=$((10#$input_minutes + 1))
			input_seconds=$((10#$input_seconds % 60))
		fi
	fi

	printf '%02d%s%02d' "$((10#$input_minutes))" ":" "$((10#$input_seconds))"
}

main "$@"
