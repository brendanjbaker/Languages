#!/usr/bin/env bash

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	gcc \
	git \
	m4 \
	make \
	wget

export CLUHOME="/opt/pclu/3.7"

mkdir -p '/opt/pclu'
pushd '/opt/pclu'
git clone 'https://github.com/nbuwe/pclu' '3.7'
pushd '3.7'
popd; popd

mkdir -p '/opt/gc'
pushd '/opt/gc'

download \
	--url 'http://www.hboehm.info/gc/gc_source/gc-7.2f.tar.gz' \
	--hash 'f4d079bd4e5ecc1f1eba2fd9a7220da42b1f8dc5'

tar -xzf 'gc-7.2f.tar.gz'
mv 'gc-7.2' '7.2f'
pushd '7.2f'

CFLAGS="-fcommon" ./configure \
	--enable-static=yes --enable-shared=no \
	--enable-threads=no --with-libatomic-ops=no \
	--prefix="${CLUHOME:?}/code/gc"

make -j"$(nproc)"
make install
popd; popd

pushd '/opt/pclu/3.7'
mkdir -p include
make symlinks
pushd 'code/include'
cp -R /opt/gc/7.2f/include/* .
popd
pushd 'code/gc/include/gc'
cp -R /opt/gc/7.2f/include/* .
popd
make
ln -s "$(realpath code/libpclu_opt.a)" '/opt/pclu/3.7/code/libpclu.a'
mkdir -p /usr/local/pclu
make install
ln -s '/usr/local/pclu/exe/pclu' '/usr/bin/pclu'
ln -s '/usr/local/pclu/exe/plink' '/usr/bin/plink'
