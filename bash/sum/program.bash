#!/usr/bin/env bash

declare -i sum

sum=0

for i in {1..100}; do
	sum+=$(( i ))
done

echo "$sum"
