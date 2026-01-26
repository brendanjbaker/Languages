use fmt;

export fn main() void = {
	let sum = 0;

	for (let i = 0; i <= 100; i += 1) {
		sum += i;
	};

	fmt::printfln("{}", sum)!;
};
