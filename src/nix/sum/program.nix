let
	numbers = builtins.genList (i: i) 101;  # 0..100 inclusive
	sum = builtins.foldl' (a: b: a + b) 0 numbers;
in
	builtins.trace (toString sum) sum
