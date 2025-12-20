using System;

public static class Program
{
	public static Int32 Main(String[] arguments)
	{
		if (arguments.Length != 1)
			return 1;

		String input = arguments[0];

		if (input.Length == 0 || input.Length > 4)
			return 2;

		if (!IsNumeric(input))
			return 2;

		String inputFixedSize = input.PadLeft(4, '0');

		String
			minutesText = inputFixedSize.Substring(0, 2),
			secondsText = inputFixedSize.Substring(2, 2);

		Int32
			minutes = Int32.Parse(minutesText),
			seconds = Int32.Parse(secondsText);

		if (seconds >= 60)
		{
			if (minutes < 99)
			{
				minutes++;
				seconds %= 60;
			}
		}

		Console.Write("{0:D2}:{1:D2}", minutes, seconds);

		return 0;
	}

	private static Boolean IsNumeric(String text)
	{
		return text.All(c => Char.IsNumber(c));
	}
}
