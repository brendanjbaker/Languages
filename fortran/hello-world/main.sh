#!/usr/bin/env bash

if [[ ! -f program ]]; then
	gfortran -o program program.f90
fi

./program
