#!/usr/local/bin/perl

# A permutation is an ordered arrangement of objects. For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4.
# If all of the permutations are listed numerically or alphabetically, we call it lexicographic order. The lexicographic permutations of 0, 1 and 2 are:

# 012   021   102   120   201   210

# What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?

use strict;
$\=$/;

# This is a lazy-computed array which contains the number of permutation of N digits, ie N!
my @PERM; sub perm {
	my ($N)=@_;
	return $PERM[$N] if $PERM[$N];
	return 1 if $N < 2;
	$PERM[$N] = $N * perm($N-1);
	# return the last result is implicit
}

my $DIGIT=10; # digits are 0 to $DIGIT-1
my $count=999999; # 0-indexed count of the permutation to find

# To find the result, we will use an array of "unused digits". The Nth digit may be found by counting how many digit-permutation of (D-N) digit-left it is possible to make fit into the given count.
my @unused = 0 .. $DIGIT-1;
my $solution='';
foreach my $Nth (1 .. $DIGIT) {
	my $permutation_of_right_side = perm($DIGIT - $Nth);
	my $fit = int($count / $permutation_of_right_side);
	print "Nth=$Nth ( $permutation_of_right_side permutation), $fit fit";
	# The digit is the $fit-th of the unused digits
	my $chose = splice @unused,$fit,1;
	print "chose=$chose   unused=@unused";
	$count -= $fit * $permutation_of_right_side;
	$solution .= $chose;
}
print "SOLUTION = $solution";