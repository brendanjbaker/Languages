#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	ca-certificates \
	wget

mkdir -p '/tmp/ballerina'
pushd '/tmp/ballerina'
wget -q 'https://dist.ballerina.io/downloads/2201.13.1/ballerina-2201.13.1-swan-lake-linux-x64.deb'
printf '%s  %s\n' '839b4761f327f8416e468aa274d1b48671f12799' 'ballerina-2201.13.1-swan-lake-linux-x64.deb' | sha1sum --check -
dpkg -i 'ballerina-2201.13.1-swan-lake-linux-x64.deb'
apt-get install -y --no-install-recommends -f
popd
rm -fr '/tmp/ballerina'
