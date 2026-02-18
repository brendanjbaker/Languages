#!/usr/bin/env bash

bats_require_minimum_version 1.5.0

@test "sum (status)" {
	run --separate-stderr /app/main.sh

	[[ "$status" -eq 0 ]]
}

@test "sum (stderr)" {
	run --separate-stderr /app/main.sh

	[[ -z "$stderr" ]]
}

@test "sum (stdout)" {
	run --separate-stderr bash -c '/app/main.sh | xxd -p'

	output_hex="$output"
	output_text=$(echo -n "$output" | xxd -p -r)

	output="$output_text"

	[[ "$output" == "5050" ]]

	output="$output_hex"

	[[ "$output" == "353035300a" ]]
}
