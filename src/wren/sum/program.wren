#!/usr/bin/env wren_cli

class Program {
	static main() {
		System.print(sum_range(0, 100))
	}

	static sum_range(begin, end) {
		var sum = 0

		for (i in begin..end) {
			sum = sum + i
		}

		return sum
	}
}

Program.main()
