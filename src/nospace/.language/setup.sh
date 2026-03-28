#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install --no-install-recommends -y \
	ca-certificates \
	git \
	nodejs \
	npm

declare -a sources=(
	'packages/parser/src/index.ts'
	'packages/nose/src/index.ts')

mkdir '/opt/nospace'
pushd '/opt/nospace'
git clone 'https://github.com/LeahHirst/nospace.git' '0.0.1'
pushd '0.0.1'
git checkout '60de08b7c18257161e4fb459a653fa6c4d237d28' 2> /dev/null
npm install
npx esbuild --bundle --outdir=build --platform=node "${sources[@]}"
popd; popd
