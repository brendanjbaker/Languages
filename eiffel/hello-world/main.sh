#!/usr/bin/env bash

declare bin_path="EIFGENs/program/F_code/program"

if [[ ! -f "$bin_path" ]]; then
	export ISE_EIFFEL='/usr/local/eiffel'
	export ISE_PLATFORM='linux-x86-64'

	ec -config program.ecf -target program -finalize -c_compile > /dev/null 2>&1
fi

"$bin_path" "$@"
