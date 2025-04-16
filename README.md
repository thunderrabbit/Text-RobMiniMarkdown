# Text::RobMiniMarkdown

A minimalist Markdown-to-HTML parser in Perl.  
Built by [Rob Nugen](https://www.robnugen.com) to power his [personal journal](https://perl.robnugen.com/journal.pl).

## ✨ Features

- Parses basic Markdown syntax:
  - Headings, lists, blockquotes
  - Inline code, fenced code blocks (with syntax hints)
  - Links, images, and naked URLs
  - Indented code blocks supported
- Outputs clean HTML5
- Escapes code safely using `HTML::Entities`
- Works standalone, no dependencies beyond core Perl and `HTML::Entities`

## 🐞 Known Issues

- YAML frontmatter is currently ignored

## 🧰 Usage

```perl
use lib "/full/path/to/Text-RobMiniMarkdown/lib";
use Text::RobMiniMarkdown;

my $parser = Text::RobMiniMarkdown->new;
my $html   = $parser->markdown($markdown_string);
```

## 🗂️ Directory Layout

```text
Text-RobMiniMarkdown/
├── lib/
│   └── Text/
│       └── RobMiniMarkdown.pm
├── t/
│   └── basic.t           # (Coming soon?) Tests
└── README.md
```

## 📜 License

This module is released under the same terms as Perl itself.

See [https://dev.perl.org/licenses/artistic.html](https://dev.perl.org/licenses/artistic.html) for more details.
