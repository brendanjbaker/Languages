#!/usr/bin/env bash

set -Eeuo pipefail

export PATH="/snap/bin:$PATH"

if [[ "${DEBUG_PROGRAM:-false}" == "true" ]]; then
	exec bash -x /app/main.sh "$@"
else
	exec bash /app/main.sh "$@"
fi
