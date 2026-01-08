library std;
use std.textio.all;

entity program is
end program;

architecture behavior of program is
begin
	process
		variable total : integer := 0;
		variable l : line;
	begin
		for i in 0 to 100 loop
			total := total + i;
		end loop;

		write(l, total);
		writeline(output, l);
		wait;
	end process;
end behavior;
