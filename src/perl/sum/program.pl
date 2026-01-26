#!/usr/bin/env perl

use strict;
use warnings;

my $sum = 0;

$sum += $_ for 0..100;

print "$sum\n";
