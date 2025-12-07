#!/usr/bin/env bash

bats_require_minimum_version 1.5.0

@test "hello-world" {
	run --separate-stderr /app/main.sh

	[[ "$status" -eq 0 ]]
	[[ "$output" == "Hello, world!" ]]
	[[ -z "$stderr" ]]
}
