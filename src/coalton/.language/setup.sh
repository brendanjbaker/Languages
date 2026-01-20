#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	git \
	gnupg \
	sbcl

download --url 'https://beta.quicklisp.org/quicklisp.lisp' --hash '8cdf248d44c15cd96fab14c7689340ed1505bf00'
# gpg --keyserver keyserver.ubuntu.com --recv-keys 307965AB028B5FF7
# download --url 'https://beta.quicklisp.org/quicklisp.lisp.asc' --hash '4a061b30805fc59139355cb557aeea66d9858e82'
# gpg --verify quicklisp.lisp.asc quicklisp.lisp

sbcl --load quicklisp.lisp <<- EOF
	(quicklisp-quickstart:install)
	(ql:system-apropos "vecto")
	(ql:quickload "vecto")
	(quit)
	EOF

cat > ~/.sbclrc <<- EOF
	(let ((quicklisp-init (merge-pathnames "quicklisp/setup.lisp" (user-homedir-pathname))))
	(when (probe-file quicklisp-init) (load quicklisp-init)))
	EOF

pushd ~/'quicklisp/local-projects'
git clone 'https://github.com/coalton-lang/coalton.git' 'coalton'
pushd 'coalton'
git checkout '8e2cd286d2d208de2de52300d6f37ef40a6d51b5' 2> /dev/null
popd; popd

sbcl <<- EOF
	(ql:quickload :coalton)
	(quit)
	EOF
