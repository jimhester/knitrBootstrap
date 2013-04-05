#!/usr/bin/env perl
use warnings;
use strict;
use autodie qw(:all);
###############################################################################
# By Jim Hester
# Created: 2013 Apr 05 02:45:46 PM
# Last Modified: 2013 Apr 05 04:03:00 PM
# Title:encode.pl
# Purpose: Base64 encode all hrefs
###############################################################################
# Code to handle help menu and man page
###############################################################################
use Getopt::Long;
use Pod::Usage;
my %args = ();
GetOptions(\%args, 'help|?', 'man') or pod2usage(2);
pod2usage(2) if exists $args{help};
pod2usage(-verbose => 2) if exists $args{man};
pod2usage("$0: No files given.")  if ((@ARGV == 0) && (-t STDIN));
###############################################################################
# Automatically extract compressed files
###############################################################################
@ARGV = map { s/(.*\.gz)\s*$/pigz -dc < $1|/; s/(.*\.bz2)\s*$/pbzip2 -dc < $1|/;$_ } @ARGV;
###############################################################################
# encode.pl
###############################################################################
use MIME::Base64;

while(<>){
  s{<((?:link)|(?:script))(.*href=")([^"]*)"}{
    if( -e $3){
      my $head = $1 eq 'link' ? "<$1$2data:text/css;base64," : "<$1$2data:application/x-javascript;base64,";
      my $text = encode_base64(slurp($3), '');
      "$head$text\"";
    } else {
      $1;
    }
    }eg;
    print;
}

sub slurp{
  my $file = shift;
  local $/ = undef;
  open my $fh, "<", $file;
  return scalar <$fh>;
}

###############################################################################
# Help Documentation
###############################################################################

=head1 NAME

encode.pl - Base64 encode all hrefs

=head1 VERSION

0.0.1

=head1 USAGE

Options:
      -help
      -man               for more info

=head1 OPTIONS

=over

=item B<-help>

Print a brief help message and exits.

=item B<-man>

Prints the manual page and exits.

=back

=head1 DESCRIPTION

B<encode.pl> Base64 encode all hrefs

=cut

