#!/usr/bin/env bash

grep -r '^    ' \
| grep -v '^\.git/' \
| grep -v '^cache/' \
| grep -v '^lib/' \
| grep -v '^src/b/README' \
| grep -v '^src/cobol/' \
| grep -v '^src/elm/' \
| grep -v '^src/factor/' \
| grep -v '^src/fsharp/' \
| grep -v '^src/roc/' \
| grep -v '^src/spark/' \
| grep -iv 'binary file' \
|| true
