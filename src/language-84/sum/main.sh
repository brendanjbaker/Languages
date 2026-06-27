#!/usr/bin/env bash

if [[ ! -f program ]]; then
	pushd '/opt/language-84/'* > /dev/null
	ln -s '/app/program.84' 'user_program.84'
	84 'user_program'
	cc -I. -std=gnu11 -fno-stack-protector -O0 -Wno-unused-variable -Wno-unused-function -Wno-unused-value -static -nostdlib -Wl,--build-id=none -o '/app/program' 'user_program.c' support.o
	popd > /dev/null
fi

./program "$@"
