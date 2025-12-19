#!/usr/bin/env bash

if [[ ! -f ./bin/Release/net10.0/Program ]]; then
	dotnet build --disable-build-servers --configuration Release > /dev/null
fi

"./bin/Release/net10.0/Program" "$@"
