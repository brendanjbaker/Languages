def main : i32 =
	let numbers = map i32.i64 (iota 101)
	in reduce (+) 0 numbers
