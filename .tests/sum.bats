#!/usr/bin/env bash

bats_require_minimum_version 1.5.0

@test "sum" {
	run --separate-stderr ./main.sh

	[[ "$status" -eq 0 ]]
	[[ "$output" == "5050" ]]
	[[ -z "$stderr" ]]
}
