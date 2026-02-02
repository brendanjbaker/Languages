#!/usr/bin/env bash

if [[ ! -f program.jar ]]; then
	kotlinc Program.kt -include-runtime -d program.jar 2> /dev/null
fi

java -jar program.jar
