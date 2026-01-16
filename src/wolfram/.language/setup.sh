#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends wget

mkdir '/opt/wolfram'
pushd '/opt/wolfram'

download \
	--url 'https://files.wolframcdn.com/WolframEngine/14.3.0.0/WolframEngine_14.3.0_LIN.sh' \
	--hash '5b97e53392b07693c91ac2b4139613d211e6d3f0'

chmod +x WolframEngine_14.3.0_LIN.sh
echo && echo | ./WolframEngine_14.3.0_LIN.sh > /dev/null 2>&1

popd
rm -fr '/tmp/wolfram'

wolframscript -activate <<- EOF
	Put your Wolfram email address on this line.
	Put your Wolfram password on this line.
	EOF
