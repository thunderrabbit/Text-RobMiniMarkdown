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
## 🧪 CI Status

![CI](https://github.com/thunderrabbit/Text-RobMiniMarkdown/actions/workflows/test.yml/badge.svg)

### run tests locally with `prove -l t`

## 🗂️ Directory Layout

```text
Text-RobMiniMarkdown/
├── lib/
│   └── Text/
│       └── RobMiniMarkdown.pm
├── t/
│   └── basic.t
└── README.md
```

## 📜 License

This module is released under the same terms as Perl itself.

See [https://dev.perl.org/licenses/artistic.html](https://dev.perl.org/licenses/artistic.html) for more details.
