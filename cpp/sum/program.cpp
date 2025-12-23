#include <format>
#include <iostream>

int main() {
	int sum = 0;

	for (int i = 0; i <= 100; ++i) {
		sum += i;
	}

	std::cout << std::format("{}\n", sum);

	return 0;
}
