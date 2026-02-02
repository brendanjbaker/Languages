import x10.io.Console;

class Program {
	public static def main(args:Rail[String]):void {
		var sum: Long = 0;

		for (i in 0..100) {
			sum += i;
		}

		Console.OUT.println(sum);
	}
}
