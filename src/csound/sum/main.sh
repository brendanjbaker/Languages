#!/usr/bin/env bash

# Csound prints everything to stderr, and begins each line with a "^[[m" escape sequence.
csound program.csd 2>&1 | ansifilter | grep -E '^[0-9]+$'
