#!/usr/bin/env bash

if [[ ! -f program.svbin ]]; then
	sievec program.sieve program.svbin
	chmod go+rw program.svbin
fi

sieve-test program.sieve email.eml 2>&1
