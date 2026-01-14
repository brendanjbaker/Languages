def sum_range(begin: int, end: int) -> int:
	var sum = 0

	for(end + 1) i:
		sum += i

	return sum

def main():
	let sum = sum_range(0, 100)

	print(sum)

main()
