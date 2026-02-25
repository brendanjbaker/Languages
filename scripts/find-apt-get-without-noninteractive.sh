#!/usr/bin/env bash

grep -Flr "apt-get" \
| xargs grep -Li "noninteractive" \
| grep -v '^notes/' \
| grep -v '^scripts/' \
|| true
