#!/usr/bin/env bash

output_filename="program"

dmd program.d -of${output_filename}

./$output_filename
