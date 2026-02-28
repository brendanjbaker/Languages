use t3x: t;
use string: str;
use io;

sum_range(a, b) do
	var n, sum;

	sum := 0;

	for (n = a, b + 1) do
		sum := sum + n;
	end

	return sum;
end

do
	var sum, sum_text;

	sum := sum_range(0, 100);
	sum_text := str.ntoa(sum, 10);

	io.writes(sum_text);
	io.nl();
end
