#!/usr/bin/env bash

if [[ "${DEBUG_PROGRAM:-false}" == "true" ]]; then
	bash -Eeuxo pipefail /app/main.sh "$@"
else
	bash -Eeuo pipefail /app/main.sh "$@"
fi
