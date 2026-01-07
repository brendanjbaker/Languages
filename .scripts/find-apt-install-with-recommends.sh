#!/usr/bin/env bash

grep -ir "apt-get install" . \
| grep -v 'no-install-recommends' \
| awk --field ':' '{ print $1; }'
