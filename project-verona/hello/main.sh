#!/usr/bin/env bash

pushd '/usr/local'
pushd 'verona'
mkdir 'build_ninja'
pushd 'build_ninja'
cmake .. -DVERONA_LLVM_LOCATION=/usr/lib/llvm-19 -DVERONA_DOWNLOAD_LLVM=OFF -GNinja -DCMAKE_BUILD_TYPE=Release
ninja
popd; popd; popd
ln -s /usr/local/verona/build_ninja/dist/veronac /usr/bin/veronac

veronac --run Program.verona "$@"
