#!/usr/bin/env bash

export XDG_RUNTIME_DIR=~

if [[ ! -f program ]]; then
	zxbc -f tap --autorun --BASIC 'program.bas'
fi

#SDL_VIDEODRIVER=dummy SDL_AUDIODRIVER=dummy fuse --no-sound --auto-load program.tap
# fuse --graphics-filter 'none' --no-sound --no-joystick --machine 48 --auto-load 'program.tap'
# fuse-sdl --tape --no-sound program.tap
# zesarux --ao null --vo null --machine 48k 'program.z80'
# zesarux --ao null --vo simpletext --machine 48k --tape 'program.tap'
zesarux --ao null --vo simpletext --machine zx80 --tape 'program.tap'
