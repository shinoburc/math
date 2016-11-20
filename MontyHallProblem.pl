#!/usr/bin/perl

# The Monty Hall Problem
# http://www.montyhallproblem.com/

# e.g.)
# $ perl MontyHallProblem.pl
# win_count_not_reselect: 3322
# win_count_reselect: 6679

use strict;

my $win_count_not_reselect = 0;
my $win_count_reselect = 0;

foreach(0..10000){
  my %doors = (0 => 0, 1 => 0, 2 => 0);

  # generate correct door
  my $correct_door_number = int(rand(3));
  $doors{$correct_door_number} = 1;

  # select door
  my $selected_door_number = int(rand(3));

  # open incorrect door
  my $open_door_number;
  foreach my $door_number(keys %doors){
    # not open correct door
    next if $doors{$door_number} == 1;
    # not open selected door
    next if $door_number == $selected_door_number;

    # !! This is a factor that raises the probability!

    $open_door_number = $door_number;
    last;
  }

  # not re-select
  if($selected_door_number == $correct_door_number){
    $win_count_not_reselect++;
  }

  # re-select
  my $reselected_door_number;
  foreach my $door_number(keys %doors){
    next if $door_number == $open_door_number;
    next if $door_number == $selected_door_number;
    $reselected_door_number = $door_number;
    last;
  }
  if($reselected_door_number == $correct_door_number){
    $win_count_reselect++;
  }
}

print "win_count_not_reselect: " . $win_count_not_reselect . "\n";
print "win_count_reselect: " . $win_count_reselect . "\n";
