#!/usr/bin/env bash

if [[ ! -f program ]]; then
	declare bau_home=$(echo /opt/bau/*)
	declare bau_jar="$bau_home/target/bau.jar"

	java -jar "$bau_jar" program.bau > /dev/null
	gcc -O3 program.c -o program
fi

./program "$@"
