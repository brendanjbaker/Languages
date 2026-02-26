#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	ca-certificates \
	wget

mkdir -p '/opt/isabelle'
pushd '/opt/isabelle'
wget -q --no-check-certificate 'https://isabelle.in.tum.de/dist/Isabelle2025-2_linux.tar.gz'
printf '%s  %s\n' '5d98313a946cea1f8251622d12433ffa251b4046' 'Isabelle2025-2_linux.tar.gz' | sha1sum --check -
tar -xvf 'Isabelle2025-2_linux.tar.gz' > /dev/null
rm 'Isabelle2025-2_linux.tar.gz'
mv 'Isabelle2025-2' '2025-2'
pushd
ln -s '/opt/isabelle/2025-2/bin/isabelle' '/usr/bin/isabelle'
