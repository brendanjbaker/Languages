#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	ca-certificates \
	git \
	libvoikko1 \
	nodejs \
	python3 \
	unzip \
	wget

mkdir '/tmp/tampio'
pushd '/tmp/tampio'

download \
	--url 'https://www.puimula.org/htp/testing/voikko-snapshot-v5/dict-morpho.zip' \
	--hash '340fe82ec6bac08a8e2decebe81d9ba8a4338e31'

unzip 'dict-morpho.zip' -d ~/.voikko

popd
rm -fr 'tmp/tampio'

# The first time running, the Tampio compiler emits these warnings:
#
#     /opt/tampio/1.46/lex.py:233: SyntaxWarning: invalid escape sequence '\s'
#       return self.isComment() or not not re.fullmatch("\s*", self.token)
#     /opt/tampio/1.46/lex.py:235: SyntaxWarning: invalid escape sequence '\('
#       return not not re.fullmatch("#[^\n]*\n|\([^()]*\)", self.token)
#
function swallow_initial_warning {
	pushd '/opt/tampio/1.46'
	python3 /opt/tampio/1.46/tampio.py /opt/tampio/1.46/std.itp > /dev/null 2>&1
	popd
}

mkdir '/opt/tampio'
pushd '/opt/tampio'
git clone 'https://github.com/fergusq/tampio.git' '1.46'
pushd '1.46'
git checkout 'b0017d2557a21c47fddc20cfceeb92f4e0376401' 2> /dev/null
swallow_initial_warning
popd; popd
