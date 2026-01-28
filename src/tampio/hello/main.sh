#!/usr/bin/env bash

if [[ ! -f program.js ]]; then
	python3 "/opt/tampio/1.46/tampio.py" --print-included program.itp > program.js

	declare main_method

	main_method=$(cat program.js | grep '^function ' | tail -n -1 | awk '{ print $2; }')

	echo "${main_method};" >> program.js
fi

node program.js "$@"
