#!/usr/bin/env bash

set -Eeuo pipefail

if [[ "${DEBUG_CONTAINER:-false}" == "true" ]]; then
	set -x
fi

export PATH="/snap/bin:$PATH"

systemctl start snapd
snap wait system seed.loaded
snap install core24 snapd
