#!/usr/bin/env bash

erlc program.erl
erl -noshell -pa . -s program program -s init stop
