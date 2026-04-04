fn sum_range(begin, end) {
	var sum = 0

	for n in begin..=end {
		sum = sum + n
	}

	return sum
}

println(sum_range(0, 100))
