#!/usr/bin/perl

# find Perfect Number
# Perfect Number 6 : divisor(6) -> 1, 2, 3 -> 1 + 2 + 3 = 6
# Perfect Number 28 : divisor(28) -> 1, 2, 4, 7, 14 -> 1 + 2 + 4 + 7 + 14 = 28
# Perfect Number 496 : ...

use strict;

foreach my $number (1..10000){
  if($number == &sum_of_divisor($number)){
    print $number . "\n";
  }
}

sub sum_of_divisor($){
  my $number = shift;
  
  my $sum_of_divisor = 1;
  foreach my $divisor(2..($number/2)){
    if($divisor == $number){
      last;
    }
    if($number % $divisor == 0){
      $sum_of_divisor += $divisor;
    }
  }
  return $sum_of_divisor;
}
