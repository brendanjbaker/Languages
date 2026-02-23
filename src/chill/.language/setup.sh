#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	git \
	python3 \
	python3-pip

mkdir '/opt/chill'
pushd '/opt/chill'
git clone 'https://github.com/Zaneham/Chill-compiler.git' 'a710794'
pushd 'a710794'
git checkout 'a710794f07161e37466ecb8ca27574fdc973a486' 2> /dev/null
pip install --break-system-packages --editable .
popd; popd
