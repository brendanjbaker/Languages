#!/usr/bin/env bash

export MONO_PATH='/opt/cobra/0.9.6/Source/Snapshot'

if [[ ! -f Program.exe ]]; then
	mono /opt/cobra/0.9.6/Source/Snapshot/cobra.exe -c Program.cobra > /dev/null
fi

mono Program.exe "$@"
