std := load('std')

log := std.log
range := std.range
reduce := std.reduce

SumRange := (begin, end) => (
	numbers := range(begin, end + 1, 1)
	sum := reduce(numbers, (accumulator, n) => accumulator + n, 0)

	sum
)

Main := () => (
	result := SumRange(0, 100)

	log(result)
)

Main()
