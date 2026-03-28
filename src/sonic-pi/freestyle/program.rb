tone_hz = 600
tone_length = 1
silence_length = 0.5

with_recording do
	repeat 3 do
		play tone_hz, sustain: tone_length, release: 0
		sleep tone_length
		sleep silence_length
	end
end
