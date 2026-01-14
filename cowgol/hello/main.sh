#!/usr/bin/env bash

if [[ ! -f program ]]; then
	declare cowgol_home="/opt/cowgol/0.6.1"

	cowfe-for-80386-with-nncgen -I"$cowgol_home/rt/" -I"$cowgol_home/rt/lx386/" program.cow program.cob > /dev/null
	cowbe-for-80386-with-nncgen program.cob program.coo > /dev/null
	cowlink-for-lx386-with-nncgen "$cowgol_home/.obj/rt/lx386/+cowgolcoo/cowgol.coo" program.coo -o program.s > /dev/null
	i686-linux-gnu-as program.s -o program.o
	i686-linux-gnu-ld program.o -o program
fi

./program "$@"
