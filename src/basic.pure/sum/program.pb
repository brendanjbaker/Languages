Procedure.i SumRange(start.i, finish.i)
	Protected n.i, sum.i = 0

	For n = start To finish
		sum + n
	Next

	ProcedureReturn sum
EndProcedure

Define.i sum = SumRange(0, 100)
Define.s sumText = Str(sum)

PrintN(sumText)
