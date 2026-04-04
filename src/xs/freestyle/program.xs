-- Note:
-- Tags (tagged blocks) only appear to work correctly in script mode, not
-- compiled/bytecode mode.

tag thrice() {
	yield;
	yield;
	yield;
}

thrice() {
	println("Hello!")
}
