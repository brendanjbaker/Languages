function formatTime(minutes, seconds) {
	const minutesPadded = String(minutes).padStart(2, '0');
	const secondsPadded = String(seconds).padStart(2, '0');
	const formatted = `${minutesPadded}:${secondsPadded}`;

	return formatted;
}

function isNumeric(text) {
	return typeof text === "string" && /^\d+$/.test(text);
}

if (process.argv.length != 3)
	process.exit(1);

const input = process.argv[2];

if (input.length < 1 || input.length > 4)
	process.exit(2);

if (!isNumeric(input))
	process.exit(2);

const inputFixed = input.padStart(4, '0');
const inputMinutes = inputFixed.substring(0, 2);
const inputSeconds = inputFixed.substring(2, 4);

var minutes = parseInt(inputMinutes, 10);
var seconds = parseInt(inputSeconds, 10);

if (seconds >= 60) {
	if (minutes < 99) {
		minutes++;
		seconds %= 60;
	}
}

const formatted = formatTime(minutes, seconds);

console.info(formatted);
