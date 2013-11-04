# unicode_titlecase gem
[![Gem Version](https://badge.fury.io/rb/unicode_titlecase.png)](http://badge.fury.io/rb/unicode_titlecase)
[![Code Climate](https://codeclimate.com/github/cantab/unicode_titlecase.png)](https://codeclimate.com/github/cantab/unicode_titlecase)
[![Build Status](https://travis-ci.org/cantab/unicode_titlecase.png?branch=master)](https://travis-ci.org/cantab/unicode_titlecase)

Gem to enable easy title casing of strings containing Unicode text.

## Introduction
This gem patches the String class to provide a unicode_titlecase method, which returns a string that is 'title cased': the first letter in each significant word is in capitals with the rest in lowercase.

## Features
* handles text containing Unicode characters
* handles words that should always be left capitalised (e.g., 'HIV')
* handles words that should always be left in lower case (e.g., 'to')

## Installation

Add this line to your application's Gemfile:

    gem 'unicode_titlecase'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install unicode_titlecase

## Usage


To use, just call the unicode_titlecase method on any string you want to titlecase.

For example,

    require 'unicode_titlecase'

    s = "the rain in spain stays mainly in the plain"
    puts s.unicode_titlecase

gives

    "The Rain in Spain Stays Mainly in the Plain"

More examples are set out in the YAML files in the /spec/examples directory.

## Unicode Text

With the help of the unicode-utils gem, we can properly handle title casing of Unicode text.

For example, the string 

	W Hiszpanii mży, gdy dżdżyste przyjdą dni

is titlecased to

	W Hiszpanii Mży, Gdy Dżdżyste Przyjdą Dni

More examples [here](https://github.com/cantab/unicode_titlecase/blob/master/spec/examples/unicode_examples.yaml).

## 'Big Words'

In some circumstances, you may have source text that contains words that should remain capitalised. These include Roman numerals ('VIII'), legal entity designations ('SA', 'AB', 'LLC') or technical abbreviations ('RNA', DNA', 'HIV').

The unicode_titlecase gem allows you to set up a list of 'big words' which it will keep upper-cased.

	"DNA vs RNA - difference and comparison".unicode_titlecase

produces

	"DNA vs RNA - Difference and Comparison"
	
More examples [here](https://github.com/cantab/unicode_titlecase/blob/master/spec/examples/bigword_examples.yaml).

## 'Small Words'

Similarly, you source text may contain words that should always be in lower case.

For example, in English, a number of short words such as 'is', 'of' and 'by' might be considered to look better in title cased text if they remain in lower case.

So

	'a government by the people for the people'.unicode_titlecase
	
will give

	'A Government by the People for the People'
	
More examples [here](https://github.com/cantab/unicode_titlecase/blob/master/spec/examples/standard_examples.yaml).

## Troubleshooting

- [irb does not display Unicode] (https://github.com/cantab/unicode_titlecase/wiki/Displaying-Unicode-Text-in-irb)

## Sources and Acknowledgements

Much of the source is based on Sam Souder's 'titlecase' gem at [samsouder/titlecase] (http://github.com/samsouder/titlecase) which in turn is derived from the [rules] (http://daringfireball.net/2008/05/title_case) formulated by John Gruber.

#### Gruber's Rules
  - capitalize each word
  - downcase each of the small_words
  - words with capitals after the first character are left alone
  - words with periods are left alone
  - first and last word always capitalized
  - small words after colons are capitalized

#### titlecase gem by samsouder

  - implemented rules in Ruby
  - [Github repo] (http://github.com/samsouder/titlecase)
  - [Rubygems.org] (http://rubygems.org/gems/titlecase)

#### Others
  - Jim Nanney ([Github](https://github.com/jimnanney)) contributed to some of the code (go remote pairing!)

## Further Features?
Here's a list of things we'd like to see in a future version of the unicode_titlecase gem. Please feel free to take any of these on (see [Contributing] (http://github.com/cantab/unicode_titlecase#contributing) below).
  - handle strings with 'mixed case words' such as GmbH
  - place exceptions into separate files in e.g., YAML (instead of storing in local variables)

## Contributing
Feel free to drop us a line to let us know you would like to work on something or if you have an idea. Otherwise, fork, code, commit, push and create pull request, *viz*:

1. Create a fork of the repo from http://github.com/cantab/unicode_titlecase.
2. Create your feature branch (`git checkout -b new-feature`).
2. Write some tests (in RSpec, if you please).
3. Write the code that allows the tests to pass.
3. Commit your changes (`git commit -am 'Add some feature'`).
4. Push to the branch (`git push origin new-feature`).
5. Create a new [Pull Request] (https://help.github.com/articles/using-pull-requests).

More details on how to contribute can be found at this great Thoughtbot blogpost [8 (new) steps for fixing other people's code] (http://robots.thoughtbot.com/8-new-steps-for-fixing-other-peoples-code).

## License

Copyright (c) 2013 Chong-Yee Khoo, released under the MIT License.

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
