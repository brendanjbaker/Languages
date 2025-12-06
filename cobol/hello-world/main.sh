#!/usr/bin/env bash

# Option "o": Output filename.
# Option "O": Enable optimization; otherwise compiler complains.
# Option "x": Create an executable program (instead of a library).
cobc -o program -O -x program.cob

./program
