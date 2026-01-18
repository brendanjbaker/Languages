#!/usr/bin/env bash

set -Eeuo pipefail

touch '/usr/bin/download'
chmod +x '/usr/bin/download'
cat 'download.bash' > '/usr/bin/download'

if [[ "${DEBUG_SETUP:-false}" == "true" ]]; then
	set -x
fi

systemctl start snapd
snap wait system seed.loaded

# shellcheck disable=SC1091
source '/setup/language/setup.sh'
