using System;

public static class Program
{
	public static void Main()
	{
		int sum = 0;

		for (int i = 0; i <= 100; i++)
		{
			sum += i;
		}

		Console.WriteLine(sum);
	}
}
