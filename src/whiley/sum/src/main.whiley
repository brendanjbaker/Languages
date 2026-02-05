import std::io

type Range is { int begin, int end }

function Range(int begin, int end) -> (Range range)
requires begin <= end
ensures range.begin <= range.end:
	return { begin: begin, end: end }

function sum_range(Range range) -> int:
	int sum = 0

	for i in range.begin..(range.end + 1):
		sum = sum + i

	return sum

public export method main():
	io::println(sum_range(Range(0, 100)))

method test_result():
	assume 1 == 2
