#!/usr/bin/env bash

declare jar_path="target/program-0.0.0-standalone.jar"

if [[ ! -f "$jar_path" ]]; then
	lein compile > /dev/null 2>&1
	lein uberjar > /dev/null 2>&1
fi

java -jar "$jar_path"
