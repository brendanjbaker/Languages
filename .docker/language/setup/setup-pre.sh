#!/usr/bin/env bash

set -Eeuo pipefail

if [[ "${DEBUG_SETUP:-false}" == "true" ]]; then
	set -x
fi

systemctl start snapd
snap wait system seed.loaded

source /setup/language/setup.sh
