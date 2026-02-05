<CsoundSynthesizer>
<CsOptions>
	; -n No audio output device
	; -m0 minimal tty output
	-n -m0
</CsOptions>
<CsInstruments>
	instr 1
		prints "Hello, world!\n"
		turnoff
	endin
</CsInstruments>
<CsScore>
	i 1 0 1 ; Run instrument 1 for 1 second
	e
</CsScore>
</CsoundSynthesizer>
