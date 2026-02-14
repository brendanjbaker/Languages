import gleam/io
import gleam/int

pub fn sum_range(begin: Int, end: Int) -> Int {
	int.range(begin, end + 1, 0, fn(acc, n) { acc + n })
}

pub fn main() {
	let sum = sum_range(0, 100)
	let sum_text = int.to_string(sum)

	io.println(sum_text)
}
