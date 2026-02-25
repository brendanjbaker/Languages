#!/usr/bin/env bash

if [[ ! -f program ]]; then
	declare austral_home='/opt/austral/0962d2a'

	declare -a standard_library=(
		"$austral_home/standard/src/Tuples.aui,$austral_home/standard/src/Tuples.aum"
		"$austral_home/standard/src/Bounded.aui,$austral_home/standard/src/Bounded.aum"
		"$austral_home/standard/src/Equality.aui,$austral_home/standard/src/Equality.aum"
		"$austral_home/standard/src/Order.aui,$austral_home/standard/src/Order.aum"
		"$austral_home/standard/src/Box.aui,$austral_home/standard/src/Box.aum"
		"$austral_home/standard/src/Buffer.aui,$austral_home/standard/src/Buffer.aum"
		"$austral_home/standard/src/String.aui,$austral_home/standard/src/String.aum"
		"$austral_home/standard/src/StringBuilder.aui,$austral_home/standard/src/StringBuilder.aum"
		"$austral_home/standard/src/IO/IO.aui,$austral_home/standard/src/IO/IO.aum"
		"$austral_home/standard/src/IO/Terminal.aui,$austral_home/standard/src/IO/Terminal.aum")

	austral compile "${standard_library[@]}" program.aui,program.aum --entrypoint="Program:main" --output=program
fi

./program "$@"
