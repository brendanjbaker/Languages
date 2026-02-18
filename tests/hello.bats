#!/usr/bin/env bash

bats_require_minimum_version 1.5.0

@test "hello (status)" {
	run --separate-stderr /app/main.sh

	[[ "$status" -eq 0 ]]
}

@test "hello (stderr)" {
	run --separate-stderr /app/main.sh

	[[ -z "$stderr" ]]
}

@test "hello (stdout)" {
	run --separate-stderr bash -c '/app/main.sh | xxd -p'

	output_hex="$output"
	output_text=$(echo -n "$output" | xxd -p -r)

	output="$output_text"

	[[ "$output" == "Hello, world!" ]]

	output="$output_hex"

	[[ "$output" == "48656c6c6f2c20776f726c64210a" ]]
}
