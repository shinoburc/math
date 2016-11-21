#!/usr/bin/perl

# The Monty Hall Problem
# http://www.montyhallproblem.com/

# e.g.)
# $ perl MontyHallProblem.pl
# win_count_not_reselect: win=334035, lose=665965, winning_percentage=33.4035%
# win_count_reselect: win=665966, lose=334034, winning_percentage=66.5966%

use strict;

my $win_count_not_reselect = 0;
my $win_count_reselect = 0;

my $number_of_rounds = 1000000;

foreach(0..$number_of_rounds){
  my %doors = (0 => "untouch", 1 => "untouch", 2 => "untouch");

  # generate correct door
  $doors{int(rand(3))} = "correct";

  # select door
  my $selected_door_number = int(rand(3));

  # open incorrect door
  foreach my $door_number(keys %doors){
    # not open correct door
    next if $doors{$door_number} eq "correct";
    # not open selected door
    next if $door_number == $selected_door_number;

    # !! This is a factor that raises the probability!

    $doors{$door_number} = "open";
    last;
  }

  # not re-select
  if($doors{$selected_door_number} eq "correct"){
    $win_count_not_reselect++;
  }

  # re-select
  foreach my $door_number(keys %doors){
    next if $doors{$door_number} eq "open";
    next if $door_number == $selected_door_number;
    if($doors{$door_number} eq "correct"){
        $win_count_reselect++;
    }
    last;
  }
}

print "win_count_not_reselect: win=" . $win_count_not_reselect 
      . ", lose=" . ($number_of_rounds - $win_count_not_reselect)
      . ", winning_percentage=" . $win_count_not_reselect / $number_of_rounds * 100
      . "%\n";
print "win_count_reselect: win=" . $win_count_reselect 
      . ", lose=" . ($number_of_rounds - $win_count_reselect)
      . ", winning_percentage=" . $win_count_reselect / $number_of_rounds * 100
      . "%\n";
