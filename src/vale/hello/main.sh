#!/usr/bin/env bash

if [[ ! -f bin/program ]]; then
	declare vale_home='/opt/vale/0.2.0'
	declare valec="$vale_home/valec"

	"$valec" build program='program.vale' --output_dir 'bin' -o program > /dev/null
fi

./bin/program "$@"
