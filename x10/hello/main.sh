#!/usr/bin/env bash

export JAVA_HOME='/usr/lib/jvm/java-21-openjdk-amd64'

if [[ ! -f Program.class ]]; then
	x10c Program.x10
fi

x10 Program "$@"
