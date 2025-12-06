#!/usr/bin/env bash

# Options:
# 'q' ... Quiet mode.
# 'm' ... Don't colorize output.
# 'x' ... Compile.
# 'o' ... Output path.

qb64pe -q -m -x PROGRAM.BAS -o PROGRAM

echo \
| ./PROGRAM \
| grep -v '^Press enter to continue$' \
| perl -pe 'chomp if eof'
