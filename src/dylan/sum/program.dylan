Module: program

define function sum-range (start :: <integer>, finish :: <integer>) => (result :: <integer>)
	let sum = 0;

	for (n from start to finish)
		sum := sum + n;
	end;

	sum
end function;

define function main
		(name :: <string>, arguments :: <vector>)

	let result = sum-range(0, 100);

	format-out("%d\n", result);
	exit-application(0);
end function;

main(application-name(), application-arguments());
