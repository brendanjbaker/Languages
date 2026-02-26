#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	apt-transport-https \
	ca-certificates \
	git \
	openjdk-21-jdk-headless \
	wget

mkdir -p '/opt/fifth/0.7.1/compiler'
mkdir -p '/opt/fifth/0.7.1/sdk'

mkdir '/tmp/fifth'
pushd '/tmp/fifth'
wget -q 'https://packages.microsoft.com/config/debian/13/packages-microsoft-prod.deb'
printf '%s  %s\n' 'fbbb666a7efecdce77dbe60d4b1174a6c477d562' 'packages-microsoft-prod.deb' | sha1sum --check -
dpkg -i 'packages-microsoft-prod.deb'
popd
rm -fr '/tmp/fifth'

apt-get update
apt-get install -y --no-install-recommends dotnet-sdk-8.0

# Consume the "welcome to dotnet" message.
dotnet --help > /dev/null 2>&1

mkdir '/tmp/fifth'
pushd '/tmp/fifth'
git clone 'https://github.com/aabs/fifthlang.git' .
git checkout 'a3e643d296838eeede87e5aea5f8e9a8cd91e8a6' 2> /dev/null
dotnet build --configuration Release 'fifthlang.sln'
pushd 'src/Fifth.Sdk'
dotnet pack
popd; popd; popd
mv '/tmp/fifth/src/compiler/bin/Release/net8.0'/* '/opt/fifth/0.7.1/compiler'
mv '/tmp/fifth/src/Fifth.Sdk/bin/Release'/* '/opt/fifth/0.7.1/sdk'
rm -fr '/tmp/fifth'
ln -s '/opt/fifth/0.7.1/compiler/compiler' '/usr/bin/fifthc'
