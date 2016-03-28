#!/usr/bin/perl

# find Prime Factorization
# prime_factorization(6) -> 1, 2, 3
# prime_factorization(28) -> 1, 2, 2, 7

use strict;
use POSIX qw(ceil);

foreach my $number (1..100){
  print $number . ":1";
  &print_prime_factorization($number);
  print "\n";
}

sub print_prime_factorization($){
  my $number = shift;
  
  foreach my $divisor(2..(ceil(sqrt($number)))){
    if($number % $divisor == 0){
      print "," . $divisor;
      &print_prime_factorization($number / $divisor);
      last;
    }
  }
}
