begin 0;
end 100;

main() {
	extrn begin, end;
	auto i, sum;

	i = begin;

	while (i <= end) {
		sum = sum + i;
		i++;
	}

	printn(sum);
	putchar('*n');
}

printn(n) {
	if (n >= 10) {
		printn(n / 10);
	}

	putchar('0' + (n % 10));
}

putchar(c) {
	write(c);
}
