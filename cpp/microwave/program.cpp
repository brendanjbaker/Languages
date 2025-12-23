#include <iostream>
#include <string>
#include <algorithm>
#include <format>
#include <cctype>

bool isNumeric(const std::string& text) {
    return std::all_of(text.begin(), text.end(), ::isdigit);
}

int main(int argc, char* argv[]) {
	if (argc != 2)
		return 1;

	std::string input = argv[1];

	if (input.length() == 0 || input.length() > 4)
		return 2;

	if (!isNumeric(input))
		return 2;

	std::string inputFixedSize = std::string(4 - input.length(), '0') + input;

	std::string minutesText = inputFixedSize.substr(0, 2);
	std::string secondsText = inputFixedSize.substr(2, 2);

	int minutes = std::stoi(minutesText);
	int seconds = std::stoi(secondsText);

	if (seconds >= 60) {
		if (minutes < 99) {
			minutes++;
			seconds %= 60;
		}
	}

	std::cout << std::format("{:02d}:{:02d}\n", minutes, seconds);

	return 0;
}
