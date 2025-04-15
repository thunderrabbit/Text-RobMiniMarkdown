# Text/RobMiniMarkdown.pm
package Text::RobMiniMarkdown;
use strict;
use warnings;

sub new { bless {}, shift }

sub markdown {
    my ($self, $text) = @_;
    my @lines = split /\n/, $text;
    my $html = "";
    my $in_code_block = 0;
    my $in_list = 0;

    foreach my $line (@lines) {
        # Code block start/end
        if ($line =~ /^```/) {
            $html .= $in_code_block ? "</pre>\n" : "<pre>\n";
            $in_code_block = !$in_code_block;
            next;
        }
        if ($in_code_block) {
            $html .= "$line\n";
            next;
        }

        # Indented code blocks
        if ($line =~ /^ {4,}/) {
            $html .= "<pre>$line</pre>\n";
            next;
        }

        # Headings
        if ($line =~ /^(#{1,6})\s+(.*)/) {
            my $level = length($1);
            $html .= "<h$level>$2</h$level>\n";
            next;
        }

        # Horizontal rule
        if ($line =~ /^\s*(\*\*\*|---|___)\s*$/) {
            $html .= "<hr/>\n";
            next;
        }

        # Blockquote
        if ($line =~ /^>\s?(.*)/) {
            $html .= "<blockquote>$1</blockquote>\n";
            next;
        }

        # Unordered list
        if ($line =~ /^\s*[-+*]\s+(.*)/) {
            $html .= "<ul>\n" unless $in_list;
            $in_list = 1;
            $html .= "  <li>$1</li>\n";
            next;
        }

        # Ordered list
        if ($line =~ /^\s*\d+\.\s+(.*)/) {
            $html .= "<ol>\n" unless $in_list;
            $in_list = 1;
            $html .= "  <li>$1</li>\n";
            next;
        }

        # End list
        if ($in_list and $line !~ /^\s*([-+*]|\d+\.)\s+/) {
            $html .= ($line =~ /^\s*\d+\./ ? "</ol>\n" : "</ul>\n");
            $in_list = 0;
        }

        # Tables (simple row)
        if ($line =~ /^\s*\|.*\|\s*$/) {
            $html .= "<div class=\"table-row\">$line</div>\n"; # placeholder logic
            next;
        }

        # Inline code
        $line =~ s/`(.*?)`/<code>$1<\/code>/g;

        # Bold
        $line =~ s/\*\*(.*?)\*\*/<strong>$1<\/strong>/g;

        # Italic
        $line =~ s/(?<!\*)\*(.*?)\*(?!\*)/<em>$1<\/em>/g;

        # Links and images
        $line =~ s/!\[([^\]]*)\]\(([^\)]+)\)/<img alt="$1" src="$2" \/>/g;
        $line =~ s/\[([^\]]+)\]\(([^\)]+)\)/<a href="$2">$1<\/a>/g;

        # Paragraph
        $html .= "<p>$line</p>\n" unless $line =~ /^\s*$/;
    }

    # Close list if still open
    $html .= "</ul>\n" if $in_list;

    return $html;
}

1;
