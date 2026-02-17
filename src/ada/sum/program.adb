with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Program is
	Sum : Integer := 0;
begin
	for I in 0 .. 100 loop
		Sum := @ + I;
	end loop;

	Put (Item => Sum, Width => 0);
end Program;
