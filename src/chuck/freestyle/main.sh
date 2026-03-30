#!/usr/bin/env bash

chuck --silent program.chuck

stat -c '%n %s' output.wav
