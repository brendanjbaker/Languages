module Program

sumRange : Integer -> Integer -> Integer
sumRange start end =
	if start > end then 0
	else start + sumRange (start + 1) end

main : IO ()
main = do
	printLn (sumRange 0 100)
