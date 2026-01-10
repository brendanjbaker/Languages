#!/usr/bin/env bash

grep -r '^    ' \
| grep -v '^\.git/' \
| grep -v '^cobol/' \
| grep -v '^elm/' \
| grep -v '^fsharp/' \
|| true
