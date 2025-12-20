#!/usr/bin/env bash

set -Eeuo pipefail

if [[ "${DEBUG_DOCKER:-false}" == "true" ]]; then
	set -x
fi

export PATH="/snap/bin:$PATH"
