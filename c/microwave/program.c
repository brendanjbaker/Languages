#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

int main(int argc, char **argv) {
	if (argc != 2) {
		return 1;
	}

	const char *input = argv[1];
	size_t len = strlen(input);

	if (len == 0 || len > 4) {
		return 2;
	}

	for (size_t i = 0; i < len; i++) {
		if (!isdigit((unsigned char)input[i])) {
			return 2;
		}
	}

	char fixed[5] = "0000";
	memcpy(fixed + (4 - len), input, len);

	int minutes = ((fixed[0] - '0') * 10) + (fixed[1] - '0');
	int seconds = ((fixed[2] - '0') * 10) + (fixed[3] - '0');

	if (seconds >= 60) {
		if (minutes < 99) {
			minutes += 1;
			seconds %= 60;
		}
	}

	printf("%02d:%02d\n", minutes, seconds);
	fflush(stdout);

	return 0;
}
