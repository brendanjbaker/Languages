#!/usr/bin/env bash

if [[ ! -f program.js ]]; then
	tsc program.ts
fi

node program.js
