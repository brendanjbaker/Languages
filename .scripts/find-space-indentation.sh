#!/usr/bin/env bash

grep -r '^    ' \
| grep -v '^\.git/' \
| grep -v '^\.lib/' \
| grep -v '^b/README' \
| grep -v '^cobol/' \
| grep -v '^elm/' \
| grep -v '^factor/' \
| grep -v '^fsharp/' \
| grep -v '^spark/' \
|| true
