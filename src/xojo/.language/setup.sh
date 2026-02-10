#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	git \
	golang \
	libglib2.0-0 \
	libgtk-3-0 \
	libsoup2.4-1 \
	libunwind8 \
	make \
	wget \
	xvfb

# Install the Xojo IDE itself.

mkdir '/tmp/xojo'
pushd '/tmp/xojo'

download \
	--url 'https://files.xojo.com/Xojo/Xojo2025r31/xojo2025r31.deb?...' \
	--hash '7992945b29b1bb18cc80ebb27a8bc9ff1be5d154'

dpkg -i 'xojo2025r31.deb'
popd
rm -fr '/tmp/xojo'
ln -s '/opt/xojo/xojo2025r3.1/Xojo' '/usr/bin/xojo-ide'

# Install the Xojo IDE Communicator.

pushd '/opt/xojo-ide-communicator'
git clone 'https://github.com/Lodgit/xojo-ide-communicator' '0ebfc8f'
pushd '0ebfc8f'
git checkout '0ebfc8f48c0b87a59d5158585a74af8343c413a4' 2> /dev/null
make install
ln -fs '/usr/bin/bash' '/bin/sh'
make build
ln -s '/opt/xojo-ide-communicator/bin/xojo-ide-com' '/usr/bin/xojo-ide-com'
popd; popd
