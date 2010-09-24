#! /usr/bin/perl -w

use strict;

my @df = `df -t nfs`;

my $elements = pop @df;

$elements =~ s/\s+/ /g;

my @blocks = split /\s/,$elements;

my $counter = 0;

my $totalSpace = $blocks[1] / 1048576;
my $usedSpace = $blocks[2] / 1048576;
my $freeSpace = $blocks[3] / 1048576;
my $mountPoint = $blocks[5];

my $outputSpace = sprintf "$mountPoint :: Total : %.2f Gb / Free : %.2f Gb / Used : %.2f Gb", $totalSpace, $freeSpace, $usedSpace;
print "$outputSpace\n";
