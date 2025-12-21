#!/usr/bin/env bash

if [[ ! -f program.beam ]]; then
	erlc program.erl
fi

erl -noshell -pa . -s program program -s init stop "$@"
