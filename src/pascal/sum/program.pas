program _Program;

var
	sum, i: Integer;

begin
	sum := 0;
	for i := 0 to 100 do
		sum := sum + i;
	writeln(sum);
end.
