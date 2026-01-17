#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends wget

mkdir -p '/opt/isabelle'
pushd '/opt/isabelle'

download \
	--url 'https://isabelle.in.tum.de/dist/Isabelle2025-1_linux.tar.gz' \
	--hash '???'

tar -xvf 'Isabelle2025-1_linux.tar.gz' > /dev/null
rm 'Isabelle2025-1_linux.tar.gz'
mv 'Isabelle2025-1' '2025-1'
pushd
ln -s '/opt/isabelle/2025-1/bin/isabelle' '/usr/bin/isabelle'
