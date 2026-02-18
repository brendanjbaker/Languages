#!/usr/bin/env bash

declare arrow='↑'
declare exclamation_point='!'

x1sim program.a60 "$@" | sed "s/$arrow/$exclamation_point/"
