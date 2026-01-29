#!/usr/bin/env bash

if [[ ! -f bin/Program.exe ]]; then
	fifthc \
		--source '/app' \
		--output '/app/bin/Program.exe'
fi

dotnet bin/Program.exe "$@"
