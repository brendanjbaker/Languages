<CsoundSynthesizer>
<CsOptions>
	; -n No audio output device
	; -m0 minimal tty output
	-n -m0
</CsOptions>
<CsInstruments>
	instr 1
		iSum = 0
		iCount = 0

		until iCount > 100 do
			iSum = iSum + iCount
			iCount = iCount + 1
		od

		; "%.0f" prints a float with 0 decimal places
		; The 1 is a trigger; it prints once when the instrument starts
		printf_i "%.0f\n", 1, iSum
		turnoff
	endin
</CsInstruments>
<CsScore>
	i 1 0 1 ; Run instrument 1 for 1 second
	e
</CsScore>
</CsoundSynthesizer>
