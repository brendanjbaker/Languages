#!/usr/bin/env bash

declare interpreter='/opt/netrpg/current/NetRPG/bin/Release/net10.0/NetRPG.dll'

dotnet "$interpreter" program.rpgle "$@"
