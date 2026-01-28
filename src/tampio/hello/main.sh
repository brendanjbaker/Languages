#!/usr/bin/env bash

if [[ ! -f program.js ]]; then
	export TAMPIO_HOME='/opt/tampio/current'

	python3 "${TAMPIO_HOME}/tampio.py" "${TAMPIO_HOME}/std.itp" >> program.js
	python3 "${TAMPIO_HOME}/tampio.py" program.itp >> program.js

	declare main_method=$(cat program.js | grep '^function ' | tail -n -1 | awk '{ print $2; }')

	echo "${main_method};" >> program.js
fi

node program.js "$@"
