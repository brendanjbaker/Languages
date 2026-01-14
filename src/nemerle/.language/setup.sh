#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	mono-complete \
	wget

pushd /tmp
wget --quiet 'http://nemerle.org/Download/Nightly%20master-NET40-VS2010/build-283/NemerleBinaries-net-4.0-v1.2.547.0.zip'
unzip 'NemerleBinaries-net-4.0-v1.2.547.0.zip' -d /usr/local/nemerle
popd
