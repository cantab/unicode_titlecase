# unicode_titlecase gem

A set of methods added onto the String class to allow easy title casing of strings with Unicode text.

## Features

* handles Unicode text
* handles 'big words' (words that should always be left capitalised)
* handles 'small words' (words that should always be left in lower case)

## Installation

Add this line to your application's Gemfile:

    gem 'unicode_titlecase'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install unicode_titlecase

## Usage

This gem patches the String class to provide a title_case method, which returns a string that is 'title cased': the first letter in each significant word is in capitals with the rest in lowercase.

To use, just call the title_case method on any string you want to titlecase.

For example,

    'the rain in spain stays mainly in the plain'.title_case
    
gives

    'The Rain in Spain Stays Mainly in the Plain'

Examples are set out in the YAML files in the /spec/examples directory

## Unicode Text

With the help of the unicode-utils gem, we can properly handle title casing of Unicode text.

For example, the string 'W Hiszpanii mży, gdy dżdżyste przyjdą dni' will be titlecased to 'W Hiszpanii Mży, Gdy Dżdżyste Przyjdą Dni'.

## 'Big Words'

In some circumstances, you may have source text that contains words that should remain capitalised.

These include Roman numerals ('VIII'), legal entity designations ('SA', 'AB', 'LLC') or technical abbreviations ('RNA', DNA', 'HIV').

The unicode_titlecase gem allows you to set up a list of 'big words' which it will keep upper-cased.

## 'Small Words'

Similarly, you source text may contains words that should always be in lower case.

By convention, a number of short words such as 'is', 'of' and 'by' are considered to look better in text if they remain in lower case.

	'a government by the people for the people'.title_case #=> 'A Government by the People for the People'
	
## Sources

Much of the source is based on Sam Souder's 'titlecase' gem at [samsouder/titlecase] (http://github.com/samsouder/titlecase) which in turn is derived from the [rules] (http://daringfireball.net/2008/05/title_case) formulated by John Gruber.

#### Gruber's Rules:
  - capitalize each word
  - downcase each of the small_words
  - words with capitals after the first character are left alone
  - words with periods are left alone
  - first and last word always capitalized
  - small words after colons are capitalized

#### Additions in the unicode_titlecase Gem:
 - properly handle Unicode text (using the unicode_utils gem)
 - leave 'big words' capitalised

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
