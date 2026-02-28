package main

import "core:fmt"
import "core:os"
import "core:strconv"

is_numeric :: proc(text: string) -> bool {
	for c in text {
		if c < '0' || c > '9' {
			return false
		}
	}

	return true
}

main :: proc() {
	args := os.args

	if len(args) != 2 {
		os.exit(1)
	}

	input := args[1]

	if len(input) == 0 || len(input) > 4 {
		os.exit(2)
	}

	if !is_numeric(input) {
		os.exit(2)
	}

	padded: [4]u8
	pad := 4 - len(input)

	for i in 0 ..< pad {
		padded[i] = '0'
	}

	for i in 0 ..< len(input) {
		padded[pad + i] = input[i]
	}

	minutes_text := string(padded[0:2])
	seconds_text := string(padded[2:4])

	minutes64, _ := strconv.parse_int(minutes_text, 10)
	seconds64, _ := strconv.parse_int(seconds_text, 10)

	minutes := int(minutes64)
	seconds := int(seconds64)

	if seconds >= 60 {
		if minutes < 99 {
			minutes += 1
			seconds %= 60
		}
	}

	fmt.printf("%02d:%02d\n", minutes, seconds)
}
