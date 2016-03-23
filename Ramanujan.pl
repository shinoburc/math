#!/usr/bin/perl

# find a^pow + b^pow = c^pow + d^pow

use strict;

# 3 = taxy
my $pow = 3;

my %results = ();

foreach my $number1(1..1000){
  foreach my $number2(1..1000){
    my $pow1 = $number1**$pow;
    my $pow2 = $number2**$pow;
    my $result = $pow1 + $pow2;

    if(exists($results{$result})){
      if($number1 != $results{$result}{"number2"} && $number2 != $results{$result}{"number1"}){
        print $number1 . "^$pow + " . $number2 . "^$pow = ";
        print $results{$result}{"number1"} . "^$pow + ";
        print $results{$result}{"number2"} . "^$pow = " . $result;
        if(exists($results{$result}{"count"})){
          $results{$result}{"count"}++;
        } else {
          $results{$result}{"count"} = 1;
        }
        print " (" . $results{$result}{"count"} . ")\n";
      }
    }

    $results{$result}{"number1"} = $number1;
    $results{$result}{"number2"} = $number2;
  }
}
