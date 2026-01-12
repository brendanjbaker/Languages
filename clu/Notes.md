root@f4b33baa205c:/opt/clu/current# git status  | grep -i makefile
        modified:   code/cmp/Makefile.linux
        modified:   code/gc-7.2/Makefile
        modified:   code/libasm/Makefile.linux
        modified:   code/libclu/Makefile.linux
        modified:   code/sysasm/Makefile.linux
        modified:   code/sysclu/Makefile.linux
        modified:   driver/Makefile.linux

export CLUHOME='/opt/clu/current'

cd /opt/clu/current
git clean -dfx; git checkout .
pushd 'code/gc'
make clean
make CFLAGS="-O -fcommon -D_GNU_SOURCE -std=gnu89"
make gctest
./gctest
popd
pushd 'code'
make CC="gcc -std=gnu89"
popd
pushd 'cmpasm'
make CC="gcc -std=gnu89"
popd
pushd 'cmp'
make CC="gcc -std=gnu89"




apt-get install libgc-dev

pushd '/opt/clu/current'
make clean
make veryclean
git clean -dfx
git checkout .
pushd 'code/gc'
make CFLAGS="-O -fcommon -D_GNU_SOURCE -std=gnu89" LDFLAGS="-fcommon"
popd
pushd 'code/cmpasm'
make \
	CC='gcc -std=gnu89' \
	CFLAGS='-c -O -w -I../include -fcommon -std=gnu89' \
	LFLAGS='-L${CLUHOME}/code -lpclu_opt -lgc -lm -lc -lpthread -g -fcommon'
popd
pushd 'code/libasm'
make \
	CC='gcc -std=gnu89' \
	CFLAGS='-c -O -w -I../../include -fcommon -std=gnu89' \
	LFLAGS='-L${CLUHOME}/code -lpclu_opt -lgc -lm -lc -lpthread -g -fcommon'
popd
pushd 'code/sysasm'
make \
	CC='gcc -std=gnu89' \
	CFLAGS='-c -I../../include -DLINUX -fcommon -std=gnu89'
popd
pushd 'comp'
make CC="gcc -std=gnu89" compiler
popd
pushd 'code/cmp'
make clean
make \
	CC='gcc -std=gnu89' \
	CFLAGS='-c -O -w -I../include -fcommon -std=gnu89' \
	LFLAGS='-L${CLUHOME}/code -lpclu_opt -lgc -lm -lc -lpthread -g -fcommon'
popd





make \
	CC='gcc -std=gnu89' \
	CFLAGS='-c -O -w -I../include -I../../include -DLINUX -fcommon -std=gnu89' \
	LFLAGS='-L${CLUHOME}/code -lpclu_opt -lgc -lm -lc -lpthread -g -fcommon'










#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	libgc-dev \
	git

mkdir -p '/opt/clu'
pushd '/opt/clu'
git clone 'https://github.com/npe9/pclu.git' 'current'
pushd 'current'
export CLUHOME='/opt/clu/current'
git checkout '3fd06ff'
pushd 'code/gc'
./configure
make clean
make CFLAGS="-O -fcommon -D_GNU_SOURCE -std=gnu89"
make gctest
./gctest
popd
pushd 'code'
make CC="gcc -std=gnu89" debugfiles
popd
make CC="gcc -std=gnu89" compiler










make CC="gcc -std=gnu89"

# make CFLAGS="-O -fcommon"
# make install
# popd; popd










pushd 'code/libclu'
make CC="gcc -std=gnu89"
popd

pushd 'code/sysclu'
make CC="gcc -std=gnu89"
popd

# make CFLAGS="-g -O2 -std=gnu89 -Wno-implicit-function-declaration -Wno-implicit-int"
# _groups.c:65:5: note: use option '-std=c99', '-std=gnu99', '-std=c11' or '-std=gnu11' to compile your code
make clean
make CC="gcc -std=gnu99" CFLAGS="-I../../include -Wno-implicit-function-declaration -Wno-incompatible-pointer-types"
