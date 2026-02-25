#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	ca-certificates \
	git \
	python3

mkdir '/opt/flow-matic'
pushd '/opt/flow-matic'
git clone 'https://github.com/Zaneham/Flow-matic.git' '5db9af9'
pushd '5db9af9'
git checkout '5db9af976c95b0ae43e2a469e55b141b8885337e' 2> /dev/null
popd; popd
chmod +x '/opt/flow-matic/5db9af9/run_flowmatic.py'
ln -s '/opt/flow-matic/5db9af9/run_flowmatic.py' '/usr/bin/flowmatic'
