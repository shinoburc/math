#!/usr/bin/perl

# find Divisor
# divisor(6) -> 1, 2, 3
# divisor(28) -> 1, 2, 4, 7, 14

use strict;

foreach my $number (1..100){
  &print_divisor($number);
}

sub print_divisor($){
  my $number = shift;
  
  print $number . ":1";
  foreach my $divisor(2..($number/2)){
    if($divisor == $number){
      last;
    }
    if($number % $divisor == 0){
      print "," . $divisor;
    }
  }
  print "\n";
}
