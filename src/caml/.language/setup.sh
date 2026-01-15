#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

mkdir '/tmp/caml'
pushd '/tmp/caml'

download \
	--url 'http://boisson.homeip.net/depot/pool/xenial/amd64/camllight_0.82-6_amd64.deb' \
	--hash '2e95a05ef096ce9a6ee6339fe5f8c96b08fad97b'

dpkg -i --force-depends 'camllight_0.82-6_amd64.deb'
popd
rm -fr '/tmp/caml'
