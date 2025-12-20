#!/usr/bin/env bash

if [[ ! -f program ]]; then
	g++ program.cpp -o program
fi

./program
