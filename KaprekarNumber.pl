#!/usr/bin/perl

# find Kaprekar Number
# 45 * 45 = 2025 -> 20 + 25 = 45
#

use strict;

foreach my $number (1..10000){
  my $pow = $number * $number;
  my $left_length = int(length($pow) / 2);
  my $left = substr($pow, 0, $left_length);
  my $right = substr($pow, $left_length);
  if($number == ($left + $right)){
    print $number . "\n";
  }
}
