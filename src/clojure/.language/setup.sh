#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	clojure \
	leiningen \
	openjdk-21-jdk

# Make Clojure download some basic packages ahead of time (warmup).

tee project.clj <<- EOF
	(defproject warmup "0.0.0"
	:dependencies [[org.clojure/clojure "1.12.0"]])
	EOF

lein deps
