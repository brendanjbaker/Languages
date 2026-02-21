#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	git \
	libgmp-dev \
	opam \
	python3

opam init --disable-sandboxing
mkdir '/opt/austral'
pushd '/opt/austral'
git clone 'https://github.com/austral/austral.git' '0962d2a'
pushd '0962d2a'
git checkout '0962d2a8a5d77f7daacd7f696819520733f4897d' 2> /dev/null
opam switch create austral 4.13.0
eval $(opam env --switch=austral)
opam install --deps-only -y .
make
pushd 'standard'
make
popd; popd; popd
ln -s '/opt/austral/0962d2a/austral' '/usr/bin/austral'
