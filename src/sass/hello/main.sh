#!/usr/bin/env bash

sass program.scss 2>&1 | awk -F ': ' '{ print $2; }'
