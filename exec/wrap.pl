#!/usr/bin/env perl

use warnings;
use strict;

#this simply wraps standard output with the supplied tags.

my($open, $close) = (shift, shift);

print $open, "\n";
while(<>){
  print;
}
print $close, "\n";
