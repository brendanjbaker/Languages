#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install --no-install-recommends -y \
	ca-certificates \
	wget

mkdir '/tmp/caml'
pushd '/tmp/caml'
wget -q 'https://boisson.homeip.net/depot/pool/xenial/amd64/camllight_0.82-6_amd64.deb'
printf '%s  %s\n' '2e95a05ef096ce9a6ee6339fe5f8c96b08fad97b' 'camllight_0.82-6_amd64.deb' | sha1sum --check -
dpkg -i --force-depends 'camllight_0.82-6_amd64.deb'
popd
rm -fr '/tmp/caml'
