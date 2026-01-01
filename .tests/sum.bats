#!/usr/bin/env bash

bats_require_minimum_version 1.5.0

@test "sum" {
	run --separate-stderr /app/main.sh

	[[ "$status" -eq 0 ]]
	[[ "$output" == "5050" ]]
	[[ -z "$stderr" ]]
}

@test "sum (trailing newline)" {
	run --separate-stderr bash -c '/app/main.sh | xxd -p'

	[[ "$status" -eq 0 ]]
	[[ "$output" == "353035300a" ]]
	[[ -z "$stderr" ]]
}
