#!/usr/bin/env tclsh

set sum 0

for {set i 0} {$i <= 100} {incr i} {
    set sum [expr {$sum + $i}]
}

puts $sum
