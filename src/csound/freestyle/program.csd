<CsoundSynthesizer>
<CsOptions>
	-o output.wav
</CsOptions>
<CsInstruments>
	sr = 44100
	ksmps = 32
	nchnls = 1
	0dbfs = 1

	instr 1
		; Generate 600 Hz sine wave, amplitude 0.5
		aSig poscil 0.5, 600
		out aSig
	endin
</CsInstruments>
<CsScore>
	; p1=instr, p2=start, p3=dur
	i 1 0.0 1.0
	i 1 1.5 1.0
	i 1 3.0 1.0
	e 4.5
</CsScore>
</CsoundSynthesizer>
