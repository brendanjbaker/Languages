#!/usr/bin/env bash

grep -Fr './program' \
| grep -v '^\.scripts/' \
| grep -v '^elm/\.language/run\.js' \
| grep -v '@' \
|| true
