#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	git \
	nodejs

mkdir '/opt/qalb'
pushd '/opt/qalb'
git clone 'https://github.com/mz0in/Qalb.git' '2db6065'
pushd '2db6065'
git checkout '2db606595ad815d8f0224b033d286db1ac78ddf6' 2> /dev/null
popd; popd
