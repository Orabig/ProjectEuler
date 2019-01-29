#!/usr/local/bin/perl

use strict;
$\=$/;

my $N=999;
my $count=0;

foreach(1..$N) {
  next if ($_%3) and ($_%5); # Don't count multiples of 3 or 5
  $count+=$_;
}
print $count;