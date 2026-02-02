#!/usr/bin/env bash

pushd project > /dev/null

if [[ ! -f 'target/program-standalone.jar' ]]; then
	mvn package > /dev/null
fi

java -jar 'target/program-standalone.jar'

popd > /dev/null
