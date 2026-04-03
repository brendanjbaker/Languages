sum_range = (range_begin, range_end) ->
	sum = 0

	for n = range_begin, range_end
		sum += n

	return sum

sum = sum_range(0, 100)

print sum
