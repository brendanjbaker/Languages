#!/usr/bin/env bash

if [[ ! -f program.fasl ]]; then
	sbcl --eval '(compile-file "program.lisp")' --quit > /dev/null
fi

sbcl --noinform --non-interactive --load program.fasl
