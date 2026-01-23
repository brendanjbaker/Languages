#!/usr/bin/env bash

set -Eeuo pipefail

touch '/usr/bin/download'
chmod +x '/usr/bin/download'
cat '/download.sh' > '/usr/bin/download'

if [[ "${DEBUG_SETUP:-false}" == "true" ]]; then
	set -x
fi

# shellcheck disable=SC1091
source '/setup/language/setup.sh'
