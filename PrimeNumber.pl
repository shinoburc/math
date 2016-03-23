#!/usr/bin/perl

# find Prime Number

use strict;

my $loop_count = 1000;

#foreach my $number(3..$loop_count){
#  if (((2 ** ($number - 1)) % $number) == 1) {
#    print $number . "\n";
#  }
#}

my $is_prime_number;
foreach my $number(3..$loop_count){
  $is_prime_number = 1;
  foreach my $divide_number(2..$loop_count){
    last if($number <= $divide_number);
    if($number % $divide_number == 0){
      $is_prime_number = 0;
      last;
    }
  }
  if($is_prime_number == 1){
    print $number . "\n";
  }
}
