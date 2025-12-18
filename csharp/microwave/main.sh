#!/usr/bin/env bash

if [[ ! -f ./bin/Release/net10.0/Program ]]; then
	dotnet build -c Release > /dev/null
fi

exec bin/Release/*/Program "$@"
