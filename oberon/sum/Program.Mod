MODULE Program;

IMPORT Out;

VAR i, total: INTEGER;

BEGIN
	total := 0;
	i := 0;

	WHILE i <= 100 DO
		total := total + i;
		INC(i)
	END;

	Out.Int(total, 0);
	Out.Ln
END Program.
