#!/usr/bin/env bash

bats_require_minimum_version 1.5.0

@test "hello-world" {
	run --separate-stderr /app/main.sh

	[[ "$status" -eq 0 ]]
	[[ "$output" == "Hello, world!" ]]
	[[ -z "$stderr" ]]
}

@test "hello-world (trailing newline)" {
	run --separate-stderr bash -c '/app/main.sh | xxd -p'

	[[ "$status" -eq 0 ]]
	[[ "$output" == "48656c6c6f2c20776f726c64210a" ]]
	[[ -z "$stderr" ]]
}
