main() {
	extrn message;
	prints(message);
}

prints(s) {
	auto c, i, eof;

	while (!eof) {
		c = s[i];

		if (c == 0) {
			eof = 1;
		} else {
			putchar(c);
		}

		i = i + 1;
	}
}

putchar(c) {
	write(c);
}

message[100]
	'H', 'e', 'l', 'l', 'o', ',', ' ',
	'w', 'o', 'r', 'l', 'd', '!', '*n',
	0;
