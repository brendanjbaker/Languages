MODULE Program;

FROM InOut IMPORT WriteInt, WriteLn;

VAR
  sum, i: INTEGER;

BEGIN
	sum := 0;

	FOR i := 0 TO 100 DO
		sum := sum + i;
	END;

	WriteInt(sum, 0);
	WriteLn;
END Program.
