#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	ca-certificates \
	git \
	mono-complete

function apply_patch {
	pushd 'solution/Compiler'
	sed -i '/languageservice/I {N;N;d;}' 'ETH.Zonnon.csproj'
	pushd 'Compute'
	mv 'Kernels' 'kernels'
	mv 'kernels/ElementWiseCopy.c' 'kernels/elementwisecopy.c'
	mv 'kernels/MatrixExponent.c' 'kernels/matrixexponent.c'
	mv 'kernels/MatrixMatrixMultiplication.c' 'kernels/matrixmatrixmultiplication.c'
	mv 'kernels/MatrixTranspose.c' 'kernels/matrixtranspose.c'
	mv 'kernels/MatrixVectorMultiplication.c' 'kernels/matrixvectormultiplication.c'
	mv 'kernels/Reduction.c' 'kernels/reduction.c'
	mv 'kernels/VectorMatrixMultiplication.c' 'kernels/vectormatrixmultiplication.c'
	mv 'kernels/ElementWiseCopy_indexer.c' 'kernels/elementwisecopy_indexer.c'
	mv 'kernels/LU.c' 'kernels/lu.c'
	mv 'kernels/LeftLUDivision.c' 'kernels/leftludivision.c'
	mv 'kernels/LeftDivision.c' 'kernels/leftdivision.c'
	popd
	sed -i 's/\bawait\b/@await/g' 'ASTtoXML.cs'
	sed -i 's/\bawait\b/@await/g' 'ParserN.cs'
	popd
}

mkdir -p '/opt/zonnon'
pushd '/opt/zonnon'
git clone 'https://github.com/zonnonproject/compiler.git' '1.3.0.0'
pushd '1.3.0.0'
git checkout 'ea9699c241d4bad312b9d81315e599828efb8b2f' 2> /dev/null
apply_patch
pushd 'solution'
xbuild
ln -s '/opt/zonnon/1.3.0.0/solution/CommandLine/bin/2008Debug/zc.exe' '/usr/bin/zc'
ln -s '/opt/zonnon/1.3.0.0/solution/Compiler/bin/2008Debug/Zonnon.RTL.dll' '/usr/lib/Zonnon.RTL.dll'
popd; popd; popd
