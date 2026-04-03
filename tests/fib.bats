#!/usr/bin/env bash

bats_require_minimum_version 1.5.0

@test "fibonacci (status)" {
	run --separate-stderr /app/main.sh 10

	[[ "$status" -eq 0 ]]
}

@test "fibonacci (stderr)" {
	run --separate-stderr /app/main.sh 10

	[[ -z "$stderr" ]]
}

# Fibonacci numbers...
#
#  fib(0) -> 0
#  fib(1) -> 1
#  fib(2) -> 1
#  fib(3) -> 2
#  fib(4) -> 3
#  fib(5) -> 5
#  fib(6) -> 8
#  fib(7) -> 13
#  fib(8) -> 21
#  fib(9) -> 34
# fib(10) -> 55
# fib(11) -> 89
# fib(12) -> 144
@test "fibonacci (stdout)" {
	run --separate-stderr bash -c '/app/main.sh 10 | xxd -p'

	output_hex="$output"
	output_text=$(echo -n "$output" | xxd -p -r)

	output="$output_text"

	[[ "$output" == "55" ]]

	output="$output_hex"

	[[ "$output" == "35350a" ]]
}
