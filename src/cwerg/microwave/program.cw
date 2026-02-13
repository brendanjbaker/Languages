module:

import fmt

fun is_digit(character u8) bool:
	return character >= '0' && character <= '9'

fun string_length(string ^u8) uint:
	let! i uint = 0

	while ptr_inc(string, i)^ != 0:
		set i += 1

	return i

fun main(argc s32, argv ^^u8) s32:
	if argc != 2:
		return 1

	let input ^u8 = ptr_inc(argv, 1)^
	let inputLength uint = string_length(input)

	if inputLength == 0 || inputLength > 4:
		return 2

	for i = 0, inputLength, 1:
		if !is_digit(ptr_inc(input, i)^):
			return 2

	let! minutes s32 = 0
	let! seconds s32 = 0

	for i = 0, inputLength, 1:
		let digit s32 = as(ptr_inc(input, i)^ - '0', s32)

		if inputLength - i > 2:
			set minutes = minutes * 10 + digit
		else:
			set seconds = seconds * 10 + digit

	if seconds >= 60 && minutes < 99:
		set minutes += 1
		set seconds %= 60

	fmt::print#(
		minutes / 10, minutes % 10, ":",
		seconds / 10, seconds % 10, "\n"
	)

	return 0
