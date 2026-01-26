program _Program;

{$mode objfpc}
{$APPTYPE CONSOLE}

uses
	SysUtils;

var
	i, sum: Integer;
begin
	sum := 0;

	for i := 0 to 100 do
		sum := sum + i;

	WriteLn(sum);
end.
