#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

wget --quiet 'http://boisson.homeip.net/depot/pool/xenial/amd64/camllight_0.82-6_amd64.deb'
dpkg -i --force-depends 'camllight_0.82-6_amd64.deb'
rm 'camllight_0.82-6_amd64.deb'
