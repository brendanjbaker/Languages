#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	mono-complete \
	wget

mkdir '/tmp/nemerle'
pushd '/tmp/nemerle'

download \
	--url 'http://nemerle.org/Download/Nightly%20master-NET40-VS2010/build-283/NemerleBinaries-net-4.0-v1.2.547.0.zip' \
	--hash '664d004ead8d3283783ebaa73eece8be38629416'

unzip 'NemerleBinaries-net-4.0-v1.2.547.0.zip' -d /usr/local/nemerle
popd
rm -fr '/tmp/nemerle'
