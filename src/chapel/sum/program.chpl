module Program {
	proc main() {
		var sum: int = 0;

		for i in 0..100 do
			sum += i;

		writeln(sum);
	}
}
