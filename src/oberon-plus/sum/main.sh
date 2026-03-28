#!/usr/bin/env bash

if [[ ! -f Program ]]; then
	obxmc -out=. -c -build Program.obx > /dev/null 2>&1
	cc -O2 --std=c99 -Wno-incompatible-pointer-types ./*.c -lm -o Program
fi

./Program "$@"
