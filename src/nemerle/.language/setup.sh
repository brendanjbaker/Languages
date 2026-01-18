#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends cabextract

dpkg --add-architecture i386
apt-get update

apt-get install -y --no-install-recommends \
	wine \
	wine32:i386

export XDG_RUNTIME_DIR=~
export WINEPREFIX=$HOME/.wine32
export WINEARCH=win32
export WINEDEBUG=-all

wine reg add 'HKCU\Sofware\Wine' /v 'Version' /t 'REG_SZ' /d 'win7' /f

wineboot

cat > /etc/apt/sources.list.d/debian.sources <<- EOF
	Types: deb
	# http://snapshot.debian.org/archive/debian/20251229T000000Z
	URIs: http://deb.debian.org/debian
	Suites: trixie trixie-updates
	Components: main contrib
	Signed-By: /usr/share/keyrings/debian-archive-keyring.pgp

	Types: deb
	# http://snapshot.debian.org/archive/debian-security/20251229T000000Z
	URIs: http://deb.debian.org/debian-security
	Suites: trixie-security
	Components: main
	Signed-By: /usr/share/keyrings/debian-archive-keyring.pgp
	EOF

apt-get update
apt-get install -y --no-install-recommends winetricks

mkdir '/tmp/wine-mono'
pushd '/tmp/wine-mono'

download \
	--url 'https://dl.winehq.org/wine/wine-mono/9.4.0/wine-mono-9.4.0-x86.tar.xz'

mkdir -p '/opt/wine/mono'
tar -xJf 'wine-mono-9.4.0-x86.tar.xz' -C '/opt/wine/mono'
popd
rm -fr '/tmp/wine-mono'

# winetricks -q forcemono > /dev/null
winetricks -q dotnet48 > /dev/null

mkdir -p '/opt/nemerle/1.2.0.547'
mkdir '/tmp/nemerle'
pushd '/tmp/nemerle'

download \
	--url 'http://nemerle.org/Download/Nightly%20master-NET40-VS2010/build-283/NemerleBinaries-net-4.0-v1.2.547.0.zip' \
	--hash '664d004ead8d3283783ebaa73eece8be38629416'

unzip 'NemerleBinaries-net-4.0-v1.2.547.0.zip' -d '/opt/nemerle/1.2.0.547' > /dev/null
popd
rm -fr '/tmp/nemerle'
