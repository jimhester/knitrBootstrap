#!/usr/bin/env perl
use warnings;
use strict;
use autodie qw(:all);
###############################################################################
# By Jim Hester
# Created: 2013 Apr 05 02:45:46 PM
# Last Modified: 2013 Apr 10 08:52:56 AM
# Title:encode.pl
# Purpose: Base64 encode all external links
###############################################################################
# Code to handle help menu and man page
###############################################################################
use Getopt::Long;
use Pod::Usage;
my %args = ( ignore => [ 'mathjax' ] );
GetOptions( \%args, 'ignore=s@', 'help|?', 'man' ) or pod2usage(2);
pod2usage(2) if exists $args{help};
pod2usage( -verbose => 2 ) if exists $args{man};
pod2usage("$0: No files given.") if ( ( @ARGV == 0 ) && ( -t STDIN ) );
###############################################################################
# encode.pl
###############################################################################
use MIME::Base64;
use LWP::UserAgent;
use List::MoreUtils qw(any);
use File::MimeInfo;

my $ua = LWP::UserAgent->new;

#create search regexp
my @starts = ('script[^<>]+src=', 'link[^<>]+href=', 'url[(]');
my $search = '((?:' . join('|', map{ "(?:$_)"} @starts) . q{)["']*)([^#"')]+)(["')])};

while (my $line = <>) {
  print encode_string($line, $search);
}

#base64 encode urls or local files recursively
sub encode_string{
  my ($string, $search) = @_;
  #if not in our libraries to ignore
  $string =~ s{$search}{
    my($start, $url, $end) = ($1, $2, $3);

    #check for local file
    if(-e $url){
      my $text = slurp($url);
      $text = encode_string($text, $search) if $text;
      my $type = mimetype($url);
      $url="data:$type;base64," . encode_base64($text, '');
    }
    $url =~ s{^//}{http://}g;
    my $response =$ua->get($url);
    if($response->is_success){
      my $text = $response->decoded_content(charset => 'none');
      $text = encode_string($text, $search) if $text;
      my $type = $response->content_type();
      $url="data:$type;base64," . encode_base64($text, '');
    }
      "$start$url$end";
      }eg;
#}eg;
  return $string;
}

sub slurp {
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

