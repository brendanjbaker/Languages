import ballerina/io;

public function main() {
	int sum = 0;
	int i = 0;

	while i <= 100 {
		sum += i;
		i += 1;
	}

	io:println(sum);
}
