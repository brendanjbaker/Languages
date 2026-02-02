#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	apt-transport-https \
	ca-certificates \
	git \
	openjdk-21-jdk-headless \
	wget

mkdir '/tmp/fifth'
pushd '/tmp/fifth'

download \
	--url 'https://packages.microsoft.com/config/debian/13/packages-microsoft-prod.deb' \
	--hash 'fbbb666a7efecdce77dbe60d4b1174a6c477d562'

dpkg -i 'packages-microsoft-prod.deb'

popd
rm -fr '/tmp/fifth'

apt-get update
apt-get install -y --no-install-recommends dotnet-sdk-8.0

# Consume the "welcome to dotnet" message.
dotnet --help > /dev/null 2>&1

mkdir '/opt/fifth'
pushd '/opt/fifth'
git clone 'https://github.com/aabs/fifthlang.git' '0.6.1'
pushd '0.6.1'
git checkout 'v0.6.1' 2> /dev/null
dotnet build --configuration Release 'fifthlang.sln'
pushd 'src/Fifth.Sdk'
dotnet pack
popd; popd; popd
ln -s '/opt/fifth/0.6.1/src/compiler/bin/Release/net8.0/compiler' '/usr/bin/fifthc'
