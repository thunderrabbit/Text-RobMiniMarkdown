#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;

use lib 'lib';
use Text::RobMiniMarkdown;

my $parser = Text::RobMiniMarkdown->new;

ok($parser, 'Got a parser object');

# Basic Markdown
my $md = "# Hello\n\nThis is *great*.";
my $html = $parser->markdown($md);

like($html, qr/<h1>Hello<\/h1>/, 'Parses headings');
like($html, qr/<em>great<\/em>/, 'Parses italic text');

# Fenced code block with HTML content
my $code_md = <<'END_MD';
```perl
sub thing {
    my $x = "<html>";
    return $x;
}
```
END_MD

my $code_html = $parser->markdown($code_md);
like($code_html, qr/&lt;html&gt;/, 'Escapes HTML inside code blocks');
like($code_html, qr/<pre><code class="language-perl">/, 'Adds <pre><code> with class');

# Naked URL
my $url_md = "Check out https://example.com";
my $url_html = $parser->markdown($url_md);
like($url_html, qr{<a href="https://example.com">https://example.com</a>}, 'Parses naked URL');

# Markdown-style link
my $link_md = "[example](https://example.com)";
my $link_html = $parser->markdown($link_md);
like($link_html, qr{<a href="https://example.com">example</a>}, 'Parses [text](url) link');

done_testing;
