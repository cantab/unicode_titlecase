# UnicodeTitlecase

A set of methods added onto the String class to allow easy title casing of strings.

Properly handles Unicode text and includes a list of 'big words' (words that should always be left capitalised).

## Installation

Add this line to your application's Gemfile:

    gem 'unicode_titlecase'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install unicode_titlecase

## Usage

This gem patches the String class to provide a method title\_case, which returns a string that is 'title cased', i.e., the first letter in each significant word is in capitals, the rest in lowercase. To use, just call the title_case method on any string you want to titlecase.

For example,

    'the rain in spain stays mainly in the plain'.title_case
    
gives

    'The Rain in Spain Stays Mainly in the Plain'

Other examples are set out in the YAML files in the /spec directory

## Unicode Text

With the help of the unicode-utils gem, we can properly handle title casing of Unicode text.

For example,

    'W Hiszpanii mży, gdy dżdżyste przyjdą dni'.title_case
    
gives

    'W Hiszpanii Mży, Gdy Dżdżyste Przyjdą Dni'

## 'Big Words'

In some circumstances, you may have source text that contains words that should remain capitalised - for example, Roman numerals ('VIII', legal entity designations('SA', 'AB') or technical terms ('RNA', DNA').

The UnicodeTitlecase gem allows you to set up a list of 'big words' which it will keep upper-cased.

## Sources

Much of the source is based on Sam Souder's 'titlecase' gem (samsouder/titlecase) which in turn is derived from the rules set by John Gruber at <http://daringfireball.net/2008/05/title_case>.

#### Gruber's Rules:
  - capitalize each word
  - downcase each of the small_words
  - words with capitals after the first character are left alone
  - words with periods are left alone
  - first and last word always capitalized
  - small words after colons are capitalized

#### Additions in this Gem:
 - properly handle Unicode text (with unicode_utils gem)
 - leave 'big words' capitalised

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
