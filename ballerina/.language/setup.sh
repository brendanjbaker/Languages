#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends wget

mkdir -p '/tmp/ballerina'
pushd '/tmp/ballerina'
wget --quiet 'https://dist.ballerina.io/downloads/2201.13.1/ballerina-2201.13.1-swan-lake-linux-x64.deb'
dpkg -i 'ballerina-2201.13.1-swan-lake-linux-x64.deb'
apt-get install -y --no-install-recommends -f
popd
rm -fr '/tmp/ballerina'
