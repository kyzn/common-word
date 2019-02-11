#! /usr/bin/perl

# Common Word v0.1
# ./common-word.pl wordlist.txt word1 word2 word3

use warnings;
use strict;

use utf8;
no warnings 'utf8';
binmode(STDOUT, ":utf8");
use Encode qw/decode_utf8/;

use List::Util qw/max/;

# Load dictionary.
my $filename = shift @ARGV;
open(my $fh, "<", $filename) or die "Can't open $filename: $!";
my @dict = <$fh>;
close($fh);

# Process dictionary words.
my $sorted_dict;
foreach my $dict_word (@dict){
 $dict_word =~ s/\s+//g;
 $dict_word = decode_utf8($dict_word,1);
 my $sorted_word = join('', sort split //, $dict_word);
 # If "sorted word" is already in "sorted dict hash",
 #   this means there's another word with same letters.
 #   Let's keep both in value, separate with /.
 if ($sorted_dict->{$sorted_word}){
   $sorted_dict->{$sorted_word} .= '/' . $dict_word;
 } else {
   $sorted_dict->{$sorted_word}  = $dict_word;
 }
}

# Get input words.
@ARGV     = map { decode_utf8($_, 1) } @ARGV;
my @words = map { lc } @ARGV;

# Collect answers.
# "answers" is a hashref with following structure.
# key   = Dictionary word, potential answer.
#         This key will have multiple words separated with /
#         if there are any anagrams to given set of letters.
# value = Another hashref with following structure.
#   keys   = Input words.
#   values = Dictionary word that can be built with letters of
#            potential answer + current key. This will have
#            multiple words separated with / if there are any
#            anagrams to given set of letters.

# Here's an example with input words = beer trash perish bored.
# $answers = {
#   ...
#   'find' => {
#     'beer'   => 'befriend',
#     'trash'  => 'firsthand',
#     'perish' => 'friendship',
#     'bored'  => 'forbidden',
#   },
#   'set'  => {
#     'trash'  => 'shatters',
#     'bored'  => 'bestrode',
#   },
#   'dale/deal/lade/lead' => {
#      'perish' => 'dealership/leadership',
#   },
#   ...
# };

# At the same time, you have $sorted_dict hashref with:
# $sorted_dict = {
#   ...
#   'dfin' => 'find',
#   'est'  => 'set',
#   'adel' => 'dale/deal/lade/lead',
#   ...
# };

my $answers = {};
foreach my $word (@words){
  foreach my $key (keys %$sorted_dict){
    my $value = $sorted_dict->{$key};
    my $check = join('',sort split //, $word.$key);

    if(my $rearranged = $sorted_dict->{$check}){
      $answers->{$value}->{$word} = $rearranged;
    }
  }
}

# Print answers that match all of given words
my $max_input_word_size = max map { length } @words;

foreach my $key (keys %$answers){
  my $value = $answers->{$key}; # hashref
  if (scalar(keys %$value) == scalar(@words)){
    print "\n$key:\n";
    foreach my $word (@words){
      my $combined = $value->{$word};
      print "$word "
            . ( ' ' x ($max_input_word_size - length($word)) )
            . "+ $key = $combined\n";
    }
  }
}
print "\n";
