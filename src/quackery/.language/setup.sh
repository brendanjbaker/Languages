#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	git \
	python3

mkdir '/opt/quackery'
pushd '/opt/quackery'
git clone 'https://github.com/GordonCharlton/Quackery.git' '2040a49'
pushd '2040a49'
git checkout '2040a49cdd47baaea2725ce39eff2e75ac1780e2' 2> /dev/null
popd; popd
cat > '/usr/bin/quackery' <<< 'python3 /opt/quackery/2040a49/quackery.py "$@"'
chmod +x '/usr/bin/quackery'
