#!/usr/bin/env bash

declare program_path="build/Debug_Linux64/Program/Program"

if [[ ! -f "$program_path" ]]; then
	BeefBuild > /dev/null
fi

"$program_path" "$@"
