require daslib/defer;

[export]
def main {
	var sum = 0;

	for (i in range(0, 101)) {
		sum += i;
	}

	print("{sum}\n");
}
