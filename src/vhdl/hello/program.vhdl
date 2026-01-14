library std;
use std.textio.all;

entity program is
end program;

architecture behavior of program is
begin
	process
		variable l : line;
	begin
		write(l, string'("Hello, world!"));
		writeline(output, l);
		wait;
	end process;
end behavior;
