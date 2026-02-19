// Functions must be declared before they are used.

fn sum_range(begin, end)
{
	sum = 0;

	for (i = begin; i <= end; i++)
	{
		sum += i;
	}

	return sum;
}

fn main()
{
	sum = sum_range(0, 100);

	println(sum);
}
