package program

import "core:fmt"

sum_range :: proc(begin: i32, end: i32) -> i32 {
	sum: i32 = 0

	for n in begin..=end {
		sum += n
	}

	return sum
}

main :: proc() {
	fmt.println(sum_range(0, 100))
}
