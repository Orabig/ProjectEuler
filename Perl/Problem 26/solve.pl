#!/usr/local/bin/perl

# A unit fraction contains 1 in the numerator. The decimal representation of the unit fractions with denominators 2 to 10 are given:
# 
# 1/2	= 	0.5
# 1/3	= 	0.(3)
# 1/4	= 	0.25
# 1/5	= 	0.2
# 1/6	= 	0.1(6)
# 1/7	= 	0.(142857)
# 1/8	= 	0.125
# 1/9	= 	0.(1)
# 1/10	= 	0.1
# Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be seen that 1/7 has a 6-digit recurring cycle.
# 
# Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.

use strict;
$\=$/;

# Algorithm is to try every number and compute the recurring cycle length.
# To do this is easily simulating an euclidian division.

# Returns the length of cycle in 1/D
sub cycle_length {
  my ($D) = @_;
  my $N=1;
  # This will store the known remains of the division. When a remain already exists, we know we are at a cycle
  my %REMAINS;
  # We will compute N/D=Q(R)
  my $Q='';
  while(1) {
	$N*=10 while $N<$D;
	my $R = $N % $D;
	return 0 if $R==0;
	$Q .= int($N / $D); # or ($N-$R)/$D
	# print "$N = $R + $D * ".(int($N / $D));
	last if $REMAINS{$R};
	$REMAINS{$R}=1;
	$N=$R;
  }
  my @remains = keys %REMAINS;
  return $#remains;
}

my $max=0;
my $best=0;
foreach (2..999) {
	my $CL = cycle_length($_);
	print "$_ -> $CL";
	if ($CL>$max) {
		$best=$_;
		$max=$CL;
	}
}
print "BEST=$best ($max)";