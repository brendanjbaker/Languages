#!/usr/bin/env bash

bats_require_minimum_version 1.5.0

@test "freestyle (status)" {
	run --separate-stderr /app/main.sh

	[[ "$status" -eq 0 ]]
}

@test "freestyle (stderr)" {
	run --separate-stderr /app/main.sh

	[[ -z "$stderr" ]]
}

@test "freestyle (stdout)" {
	run --separate-stderr /app/main.sh

	[[ -n "$output" ]]
}
