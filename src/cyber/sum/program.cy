#!/usr/bin/env cyber

func sum_range(begin int, end int) int:
	var end_inclusive = end + 1
	var n = begin
	var sum = 0

	for begin..end_inclusive -> n:
		sum += n

	return sum

print(sum_range(0, 100))
