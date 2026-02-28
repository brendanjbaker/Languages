cd '/d/Code/Languages'
wget -q 'https://github.com/nrnrnr/qc--/archive/ec56191b669729e7ce8181a2bd97a912842ea716.tar.gz' -O 'cache/qcmm.tar.gz'
podman run -it --platform 'linux/386' -v '/d/Code/Languages/cache:/mnt/cache' 'docker.io/debian/eol:etch' '/bin/bash'

# Then, inside the container...

export DEBIAN_FRONTEND="noninteractive"

apt-get update

apt-get install --no-install-recommends -y \
	9base \
	bsdmainutils \
	build-essential \
	groff \
	liblualib40-dev \
	lua40 \
	nowebm \
	ocaml \
	texlive-latex-base \
	util-linux

ln -s '/usr/lib/9base/bin/mk' '/usr/bin/mk'
mkdir '/opt/qcmm'
tar -xzf '/mnt/cache/qcmm.tar.gz' -C '/opt/qcmm'
mv '/opt/qcmm/qc---master' '/opt/qcmm/ec56191'
mv '/usr/bin/ocamlc' '/usr/bin/ocamlc.bak'

# No-operation implementation.
cat > /usr/bin/ps2pdf <<- EOF
	#!/bin/bash
	EOF

# Temporarily fake version 3.10.0, otherwise mk refuses to build.
cat > /usr/bin/ocamlc <<- EOF
	#!/bin/bash
	echo 'The Objective Caml compiler, version 3.10.0'
	echo 'Standard library directory: /usr/lib/ocaml/3.09.2'
	EOF

chmod +x '/usr/bin/ocamlc'
chmod +x '/usr/bin/ps2pdf'
pushd '/opt/qcmm/ec56191'
./configure
echo 'config_arch = x86-linux' >> 'config/config.mk'
rm '/usr/bin/ocamlc'
mv '/usr/bin/ocamlc.bak' '/usr/bin/ocamlc'
mk timestamps
mk qc-- qc--.opt

cat > '/program.c--' <<- EOF
	target byteorder little;

	import bits32 printf;
	export main, my_data;

	section "data" {
		my_data: bits8 [] "Hello, world!\n\0";
	}

	foreign "C" main("unsigned" bits32 iargc, "address" bits32 iargv) {
		foreign "C" printf("address" my_data);
		foreign "C" return(0);
	}
	EOF
