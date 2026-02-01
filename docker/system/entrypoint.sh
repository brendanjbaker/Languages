#!/usr/bin/env bash

# shellcheck disable=SC1091

set -Eeuo pipefail

export DEBUG="${DEBUG:-false}"
export DEBUG_CONTAINER="${DEBUG_CONTAINER:-false}"
export DEBUG_PROGRAM="${DEBUG_PROGRAM:-false}"
export DEBUG_SETUP="${DEBUG_SETUP:-false}"
export MODE="${MODE:-}"
export TERM='xterm-256color'

if [[ "${MODE}" == "setup" ]]; then
	source "/entrypoint-setup.sh"
elif [[ "${MODE}" == "run" ]]; then
	source "/entrypoint-run.sh"
elif [[ "${MODE}" == "test" ]]; then
	source "/entrypoint-test.sh"
else
	echo "Error: Unknown MODE environment variable value: \"${MODE}\"."
	exit 1
fi
