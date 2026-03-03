using System;

public static class Program
{
	public static void Main()
	{
		Console.WriteLine(SumRange(0, 100));
	}

	private static int SumRange(int begin, int end)
	{
		int sum = 0;

		for (int n = begin; n <= end; n++)
		{
			sum += n;
		}

		return sum;
	}
}
