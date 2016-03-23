#!/usr/bin/perl

# find Amicable Number
# 220:284 
#   divisor(220) -> 1,2,4,5,10,11,20,22,44,55,110
#   sum_of_divisor(220) -> 284
#   divisor(284)の -> 1,2,4,71,142
#   sum_of_divisor(284) -> 220
#

use strict;

foreach my $number (1..10000){
  if($number != &sum_of_divisor($number) && $number == &sum_of_divisor(&sum_of_divisor($number))){
    print $number . ":" . &sum_of_divisor($number) . "\n";
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
      &sum_of_divisor($number / $divisor);
    }
  }
  return $sum_of_divisor;
}
