import std::io;

fn void main()
{
	int sum = 0;

	for (int i = 0; i <= 100; i++)
	{
		sum += i;
	}

	io::printfn("%d", sum);
}
