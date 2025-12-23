#!/usr/bin/env bash

if [[ ! -f program ]]; then
	g++ -std=c++20 program.cpp -o program
fi

./program "$@"
