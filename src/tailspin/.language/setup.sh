#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	ca-certificates \
	openjdk-21-jdk-headless \
	wget

mkdir -p '/opt/tailspin/c74856b'
pushd '/opt/tailspin/c74856b'
wget -q 'https://raw.githubusercontent.com/tobega/tailspin-v0/c74856bdcc0aefd02ef20c84a0189c0006a480a1/tailspin.jar'
printf '%s  %s\n' '40d75218b10b51ccc44eb858deebce9bf2443b2a' 'tailspin.jar' | sha1sum --check -
popd
cat > '/usr/bin/tailspin' <<< 'java -jar /opt/tailspin/c74856b/tailspin.jar "$@"'
chmod +x '/usr/bin/tailspin'
