class Program {
	static function main() {
		var sum = 0;

		for (i in 0...101) {
			sum += i;
		}

		Sys.println(sum);
	}
}
