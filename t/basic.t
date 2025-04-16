#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;

use lib 'lib';
use Text::RobMiniMarkdown;

my $parser = Text::RobMiniMarkdown->new;

ok($parser, 'Got a parser object');

my $md = "# Hello\n\nThis is *great*.";
my $html = $parser->markdown($md);

like($html, qr/<h1>Hello<\/h1>/, 'Parses headings');
like($html, qr/<em>great<\/em>/, 'Parses italic text');

done_testing;
