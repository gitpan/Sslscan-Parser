#!/usr/bin/perl -w
use strict;
while(<STDIN>) {
    s/ critical>/>/g;
#    s/&/&amp;/g;
    print;
}
