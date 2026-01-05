// The Carbon language is very immature, and doing a simple for-loop doesn't
// seem to currently work.

package Program;

import Core library "io";

fn Run() -> i32 {
	var i: i32 = 0;
	var sum: i32 = 0;

	while (i <= 100) {
		sum += i;
		i += 1;
	}

	Core.Print(sum);

	return 0;
}
