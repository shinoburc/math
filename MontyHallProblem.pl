#!/usr/bin/perl

# The Monty Hall Problem
# http://www.montyhallproblem.com/

# e.g.)
# $ perl MontyHallProblem.pl
# win_count_not_reselect: win=3307, lose=6693, winning_percentage=33.07%
# win_count_reselect: win=6694, lose=3306, winning_percentage=66.94%

use strict;

my $win_count_not_reselect = 0;
my $win_count_reselect = 0;

my $number_of_rounds = 100000;

foreach(0..$number_of_rounds){
  my %doors = (0 => "untouch", 1 => "untouch", 2 => "untouch");

  # generate correct door
  my $correct_door_number = int(rand(3));
  $doors{$correct_door_number} = "correct";

  # select door
  my $selected_door_number = int(rand(3));

  # open incorrect door
  foreach my $door_number(keys %doors){
    # not open correct door
    next if $doors{$door_number} eq "correct";
    # not open selected door
    next if $doors{$door_number} eq "selected";

    # !! This is a factor that raises the probability!

    $doors{$door_number} = "open";
    last;
  }

  # not re-select
  if($doors{$selected_door_number} eq "correct"){
    $win_count_not_reselect++;
  }

  # re-select
  my $reselected_door_number;
  foreach my $door_number(keys %doors){
    next if $doors{$door_number} eq "open";
    next if $doors{$door_number} eq "selected";
    $reselected_door_number = $door_number;
    last;
  }
  if($doors{$reselected_door_number} eq "correct"){
    $win_count_reselect++;
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
