#!/usr/bin/env bash

if [[ ! -f Program.class ]]; then
	javac Program.java
fi

java Program
