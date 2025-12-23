import static java.lang.System.exit;

public class Program {
	public static void main(final String[] arguments) {
		if (arguments.length != 1)
			exit(1);

		final String input = arguments[0];

		if (input.length() == 0 || input.length() > 4)
			exit(2);

		if (!isNumeric(input))
			exit(2);

		final String inputFixedSize = String.format("%4s", input).replace(' ', '0');

		final String
			minutesText = inputFixedSize.substring(0, 2),
			secondsText = inputFixedSize.substring(2, 4);

		int minutes = Integer.parseInt(minutesText);
		int seconds = Integer.parseInt(secondsText);

		if (seconds >= 60) {
			if (minutes < 99) {
				minutes++;
				seconds %= 60;
			}
		}

		System.out.printf("%02d:%02d\n", minutes, seconds);
	}

	private static boolean isNumeric(final String text) {
		return text.chars().allMatch(Character::isDigit);
	}
}
