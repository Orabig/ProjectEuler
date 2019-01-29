#!/usr/local/bin/perl

# https://projecteuler.net/problem=28

use strict;
$\=$/;

# It is easy to see that for a (2N+1) x (2N+1) spiral :
# NE numbers are a=(2N+1)²
# SW numbers are b=4N²+1
# NW numbers are c=(a+b)/2
# SE numbers are d=b-(a-c)

# Thus result = 1 + (a+b+c+d)(n=1..500)

# a+b+c+d = 16n²+4n+4

# R = 1 + 500*4 + 4(Sigma(N)) + 16(Sigma(N²))

my $S=0;
my $S2=0;
foreach(1..500) {
$S+=$_;
$S2+=$_*$_;
}
print 1+4*500+4*$S+16*$S2;