#!/usr/bin/env bash

if [[ ! -f program.js ]]; then
	wenyan --compile --output program.js program.wy
fi

cat program.js

echo
echo
echo

cat program.js \
| sed "s/\;/\;\n/g" \
| sed "s/{/\n{\n/g" \

echo
echo
echo

node program.js "$@"
