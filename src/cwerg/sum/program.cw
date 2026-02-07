module:

import fmt

pub rec Range:
	begin s32
	end s32

fun sum_range(range ^!Range) s32:
	let! sum s32 = 0

	for i = range^.begin, range^.end + 1, 1:
		set sum += i

	return sum

fun main(argc s32, argv ^^u8) s32:
	ref let! range = {Range: 0, 100}
	let sum s32 = sum_range(@!range)

	fmt::print#(sum, "\n")

	return 0
