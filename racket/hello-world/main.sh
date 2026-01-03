#!/usr/bin/env bash

if [[ ! -f program ]]; then
	raco exe program.rkt
fi

./program
