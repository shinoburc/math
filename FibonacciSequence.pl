#!/usr/bin/perl

# find Fibonacci Sequence

use strict;

my $tmp_next = 0;
my $current = 0;
my $next = 1;

#0 1 1 2 3 5

print $current . "\n";
foreach my $number1(0..30){
  print $next . " (golden ratio $current / $next = " . ($current / $next) . ")\n";

  $tmp_next = $next;
  $next += $current;
  $current = $tmp_next;
}
