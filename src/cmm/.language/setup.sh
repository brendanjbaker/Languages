#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	bsdmainutils \
	build-essential \
	ca-certificates \
	gcc \
	ghostscript \
	git \
	groff \
	make \
	noweb \
	texlive-latex-base \
	wget

mkdir '/opt/ocaml'
mkdir '/tmp/ocaml'
pushd '/tmp/ocaml'
wget -q 'https://caml.inria.fr/pub/distrib/ocaml-3.10/ocaml-3.10.2.tar.gz'
tar -xzf 'ocaml-3.10.2.tar.gz' -C '/opt/ocaml'
mv '/opt/ocaml/ocaml-3.10.2' '/opt/ocaml/3.10.2'
pushd '/opt/ocaml/3.10.2'
./configure -cc 'gcc -std=gnu89'
sed -i '/HAS_STACK_OVERFLOW_DETECTION/d' 'config/s.h'
make world
make opt
make install
ln -s '/usr/local/bin/ocamlc' '/usr/bin/ocamlc'
popd; popd
rm -fr '/tmp/ocaml'

mkdir '/opt/lua'
mkdir '/tmp/lua'
pushd '/tmp/lua'
wget -q 'https://www.lua.org/ftp/lua-4.0.1.tar.gz'
tar -xzf 'lua-4.0.1.tar.gz' -C '/opt/lua'
mv '/opt/lua/lua-4.0.1' '/opt/lua/4.0.1'
popd
rm -fr '/tmp/lua'
pushd '/opt/lua/4.0.1'
make
rm -fr /usr/local/man/man1
make install
popd

mkdir -p '/opt/qc--'
pushd '/opt/qc--'
git clone 'https://github.com/nrnrnr/qc--.git' 'ec56191'
pushd 'ec56191'
pushd 'mk'
CC='gcc -std=gnu89' make
make install
mv '/usr/local/bin/mk' '/usr/local/bin/mk.actual'
cat > '/usr/local/bin/mk' <<- 'EOF'
	#!/usr/bin/env bash

	set -Eeuxo pipefail

	while [[ $# -ge 1 ]]; do
		mk.actual "$1" || true
		shift
	done

	EOF
chmod +x '/usr/local/bin/mk'
popd
sed -i 's/"\$cc /"\$cc -std=gnu89 /g' configure
./configure
echo 'config_arch = x86-linux' >> 'config/config.mk'
echo 'config_wordsize = 32' >> 'config/config.mk'
cat >> runtime/runtime.nw <<- EOF
	<<machine-dependent macro definitions for the implementation>>=
	#define NUM_REGS 12
	@
	<<machine-dependent macro definitions for the public interface>>=
	#define ESP 8
	#define PC 0
	@
	EOF
sed -i 's/gcc -ansi/gcc -std=gnu89 -ansi/g' runtime/mkfile
notangle -Ractivation.h interp/activation.nw > interp/activation.h
mk timestamps || true
mk all all.opt || true
mk install install.opt || true
mk tools || true
ln -fs '/opt/qc--/ec56191/bin/qc--' '/usr/bin/qc--'

# notangle -Ractivation.h interp/activation.nw > interp/activation.h
# notangle -Rtable.h interp/table.nw > interp/table.h
# notangle -Rtypes.h interp/types.nw > interp/types.h
# notangle -Rmachine.h.x86 interp/interp.nw > interp/machine.h
# notangle -Ruid.h interp/uid.nw > interp/uid.h
# notangle -Rstack.h interp/stack.nw > interp/stack.h
# notangle -Rvalue.h interp/value.nw > interp/value.h
# notangle -Rassemblyunit.h interp/assemblyunit.nw > interp/assemblyunit.h
# notangle -Rcontrolflow.h interp/controlflow.nw > interp/controlflow.h
# notangle -Rlualink.h interp/lualink.nw > interp/lualink.h
# notangle -Rencoding.h interp/encoding.nw > interp/encoding.h
# notangle -Rinterp.h interp/interp.nw > interp/interp.h
# notangle -Rintervals.h interp/intervals.nw > interp/intervals.h
# notangle -Rlabel.h interp/label.nw > interp/label.h
# notangle -Rthread.h interp/thread.nw > interp/thread.h
# notangle -Rutil.h interp/util.nw > interp/util.h
# notangle -Rccall.h interp/ccall.nw > interp/ccall.h
# notangle -Rcmmfloat.h interp/cmmfloat.nw > interp/cmmfloat.h
# notangle -Roperator.h interp/operator.nw > interp/operator.h
# notangle -Rspan.h interp/span.nw > interp/span.h
# notangle -Rruntime.h interp/runtime.nw > interp/runtime.h

pushd interp
mk code
mk inspect.lua || true
mk inspect.clua || true
mk interp
popd

mk interp || true

# TODO: Update to assemble 32-bit code?
sed -i 's/as -o/as --32 -o/g' 'runtime/mkfile'

dpkg --add-architecture i386
apt-get update
apt-get install \
	gcc-multilib \
	libc6-dev-i386
