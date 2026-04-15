#!/usr/bin/env raku

sub sum-range(Int $start, Int $end) returns Int {
    my $total = 0;
    my @numbers = $start..$end;

    for @numbers -> $n {
        $total += $n;
    }

    return $total;
}

sub MAIN() {
	my $result = sum-range(0, 100);

	say $result;
}
