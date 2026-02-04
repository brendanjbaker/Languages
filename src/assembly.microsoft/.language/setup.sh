#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	ca-certificates \
	cabextract \
	dos2unix \
	git \
	msitools \
	python3 \
	unzip \
	wine64 \
	wget

export PYTHONUNBUFFERED=1

mkdir '/tmp/msvc-wine'
pushd '/tmp/msvc-wine'
git clone 'https://github.com/mstorsjo/msvc-wine.git' '32b504c'
pushd '32b504c'
git checkout '32b504c63b869681cda6824a20e30b74cb718432' 2> /dev/null
python3 vsdownload.py --accept-license --dest /opt/msvc
bash install.sh /opt/msvc
cp msvcenv-native.sh /opt/msvc
popd; popd
rm -fr '/tmp/msvc-wine'
ln -s '/usr/lib/wine/wine64' '/usr/bin/wine64'
