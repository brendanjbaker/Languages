// The Carbon language is very immature, and doesn't seem to have support for
// either printing a string directly, or even for iterating over a string's
// characters. In fact, strings don't seem to be implemented, at all. Therefore,
// we must print our message one character at a time.

package Program;

import Core library "io";

fn Run() -> i32 {
	var COMMA: char = ',';
	var EXCLAMATION_POINT: char = '!';
	var NEWLINE: char = '\n';
	var SPACE: char = ' ';

	Core.PrintChar('H');
	Core.PrintChar('e');
	Core.PrintChar('l');
	Core.PrintChar('l');
	Core.PrintChar('o');
	Core.PrintChar(COMMA);
	Core.PrintChar(SPACE);
	Core.PrintChar('w');
	Core.PrintChar('o');
	Core.PrintChar('r');
	Core.PrintChar('l');
	Core.PrintChar('d');
	Core.PrintChar(EXCLAMATION_POINT);
	Core.PrintChar(NEWLINE);

	return 0;
}
