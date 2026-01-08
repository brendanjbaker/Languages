#!/usr/bin/env bash

grep -r '    ' \
| grep -Fv 'README.md' \
| grep -Fv 'languages.sh' \
| grep -Fv '.git/' \
| grep -Fv '.scripts/' \
| grep -Fv 'elm/' \
| grep -Fv 'fsharp' \
| grep -Fv 'assembly/'
