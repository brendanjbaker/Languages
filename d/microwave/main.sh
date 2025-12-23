#!/usr/bin/env bash

output_filename="program"

if [[ ! -f "$output_filename" ]]; then
	dmd program.d -of${output_filename}
fi

./$output_filename "$@"
