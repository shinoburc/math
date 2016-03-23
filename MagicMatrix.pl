#!/usr/bin/perl

# find Magic Matrix
# sum of any column, row and diagonal will be each number.

use strict;

# 1
#
# 8 1 6  |15
# 3 5 7  |15
# 4 9 2  |15
# -------
# 15 15 15
#
# 17 24 01 08 15  |65
# 23 05 07 14 16  |65
# 04 06 13 20 22  |65
# 10 12 19 21 03  |65
# 11 18 25 02 09  |65
# ----------------
# 65 65 65 65 65  65

&matrix(7);

sub matrix($){
  my $scale = shift;
  if($scale % 2 == 0){
    $scale += 1;
  }

  my $x = ((1+$scale) / 2) - 1;
  my $y = 0;

  my $next_x = 0;
  my $next_y = 0;

  my %results = ();
  foreach my $number(1..($scale*$scale)){
    $results{$x}{$y} = $number;
    
    if($x + 1 <= $scale - 1){
      $next_x = $x + 1;
    } else {
      $next_x = 0;
    }
    if($y - 1 >= 0){
      $next_y = $y - 1;
    } else {
      $next_y = $scale - 1;
    }

    if(exists($results{$next_x}{$next_y})){
      $next_x = $x;
      $next_y = $y + 1;
    }

    $x = $next_x;
    $y = $next_y;
  }

  # print results
  my $length = length($scale*$scale);
  my $sum = 0;
  foreach my $y(0..$scale-1){
    $sum = 0;
    foreach my $x(0..$scale-1){
      $sum += $results{$x}{$y};
      printf "%0" . $length . "d ", $results{$x}{$y};
    }
    print " |$sum\n";
  }
}
