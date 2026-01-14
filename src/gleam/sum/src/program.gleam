import gleam/io
import gleam/int
import gleam/list

pub fn main() {
	let sum = list.range(0, 100)
		|> list.fold(0, int.add)

	io.println(int.to_string(sum))
}
