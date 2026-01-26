class Program {
	def static void main(String[] args) {
		println((0..100).reduce[a, b | a + b])
	}
}
