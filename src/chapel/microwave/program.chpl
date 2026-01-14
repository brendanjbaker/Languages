module Program {
	use IO;

	const DIGIT_ZERO_BYTE = '0'.toByte();
	const DIGIT_NINE_BYTE = '9'.toByte();

	proc isDigit(c: string): bool {
		const code = c.toByte();

		const isDigit =
			code >= DIGIT_ZERO_BYTE &&
			code <= DIGIT_NINE_BYTE;

		return isDigit;
	}

	proc isNumeric(text: string): bool {
		for c in text {
			if !isDigit(c) {
				return false;
			}
		}

		return true;
	}

	proc main(args: [] string): int {
		const arguments = args;

		if arguments.size != 2 then
			return 1;

		const input = arguments(1);

		if input.size == 0 || input.size > 4 then
			return 2;

		if !isNumeric(input) then
			return 2;

		const inputFixedSize = padLeft(input, 4, "0");
		const minutesText = inputFixedSize[0..1];
		const secondsText = inputFixedSize[2..3];

		var minutes = try! minutesText: int;
		var seconds = try! secondsText: int;

		if seconds >= 60 {
			if minutes < 99 {
				minutes += 1;
				seconds %= 60;
			}
		}

		writef("%02i:%02i\n", minutes, seconds);

		return 0;
	}

	proc padLeft(text: string, length: int, padChar: string): string {
		const padCount = length - text.size;

		if padCount <= 0 then
			return text;

		var result = "";

		for i in 1..padCount do
			result += padChar;

		result += text;

		return result;
	}
}
