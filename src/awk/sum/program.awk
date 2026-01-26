#!/usr/bin/awk -f

BEGIN {
	sum = 0

	for (i = 0; i <= 100; i++)
		sum += i

	print sum
}
