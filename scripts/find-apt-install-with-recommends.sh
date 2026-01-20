#!/usr/bin/env bash

grep -Fr "apt-get install" \
| grep -v '^\.git/' \
| grep -v 'no-install-recommends' \
| grep -v '^scripts/' \
| awk --field ':' '{ print $1; }' \
|| true
