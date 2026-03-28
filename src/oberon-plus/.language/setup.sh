#!/usr/bin/env bash

function retrieve {
	local url="$1"
	local directory="$2"
	local commit="$3"

	git clone "$url" "$directory"
	pushd "$directory"
	git checkout "$commit" 2> /dev/null
	popd
}

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	git \
	libx11-dev \
	libxcb1-dev

mkdir '/tmp/oberon-plus'
pushd '/tmp/oberon-plus'
retrieve 'https://github.com/rochus-keller/Oberon.git' 'Oberon' '6a830bec7294e68cd8d737feae0982d5f9ed3d67'
retrieve 'https://github.com/rochus-keller/PeLib.git' 'PeLib' '65521e50d85b87d680abf5fa14eb08f803cff897'
retrieve 'https://github.com/rochus-keller/MonoTools.git' 'MonoTools' '064d4d1b72b43f79a4a855b2d69ecdb3b4a8a330'
retrieve 'https://github.com/rochus-keller/GuiTools.git' 'GuiTools' 'df36aa5c823d0c81259ae70b7c6f194c88017d6f'
retrieve 'https://github.com/rochus-keller/LeanQt.git' 'LeanQt' 'fbadc3301770abca2df86f9955cc201076d944c8'
retrieve 'https://github.com/rochus-keller/BUSY.git' 'BUSY' '5ccecebd774928ac8ad4ed7cb30aa7a28d96961d'
pushd 'BUSY'
cc ./*.c -O2 -lm -o 'lua'
./lua 'build.lua' '../Oberon' -T 'compiler'
mkdir -p '/opt/oberon-plus/2024-07-12/'
mv 'output/OBXMC' '/opt/oberon-plus/2024-07-12/'
popd; popd
rm -fr '/tmp/oberon-plus'
ln -s '/opt/oberon-plus/2024-07-12/OBXMC' '/usr/bin/obxmc'
