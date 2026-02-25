#!/usr/bin/env bash

set -Eeuo pipefail

# shellcheck disable=SC1091
source library

grep -Flr "apt-get" \
| env --basic xargs grep -Li "noninteractive" \
| grep -v '^assets/' \
| grep -v '^cache/' \
| grep -v '^notes/' \
| grep -v '^scripts/' \
|| true
