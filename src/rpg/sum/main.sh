#!/usr/bin/env bash

declare interpreter='/opt/netrpg/753a2cd/NetRPG/bin/Release/net10.0/NetRPG.dll'

dotnet "$interpreter" program.rpgle "$@"
