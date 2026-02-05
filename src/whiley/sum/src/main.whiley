import std::io
import uint from std::int

method sum_range(uint begin, uint end) -> uint:
	uint sum = 0

	for i in begin..(end + 1):
		sum = sum + i

	return sum

public export method main():
	io::println(sum_range(0, 100))
