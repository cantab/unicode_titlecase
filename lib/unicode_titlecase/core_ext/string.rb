#encoding: UTF-8

require 'unicode_utils'

module UnicodeTitlecase
  module CoreExt
    module String

      # List of exceptions: SMALL_WORDS are words that should always be in lowercase; BIG_WORDS are words that should always be in uppercase
      SMALL_WORDS = %w(a an and as at but by be for if in is of on or the to v v. via vs vs.)
      BIG_WORDS = %w(AB A.B. A/B AS A.S. A/S S.A. KG LLC LLP DNA RNA HBV HIV I II III IV V VI VII VIII IX X AC DC Q&A AT&T)

      def unicode_titlecase

        component_words = split(" ").map do |word|
          # note: word could contain non-word characters!
          # downcase all small_words, upcase all big words, smart capitalize the rest

          word.unicode_downcase! if word.all_caps? and not word.is_big_word?

          if word.strip_non_word_chars.unicode_downcase.is_small_word?
            word.unicode_downcase!
          else
            if word.strip_non_word_chars.unicode_upcase.is_big_word?
              word.unicode_upcase!
            else
              word.smart_capitalize!
            end
          end
        end

        component_words = strip_spaces(component_words)
        smart_capitalize_ends!(component_words)
        result = component_words.join(" ")
        capitalize_small_words_after_colons(result)
      end

      def unicode_titlecase!
        replace(unicode_titlecase)
      end

      def smart_capitalize
        # ignore any leading crazy characters and capitalize the first real character
        if self =~ /^['"\(\[']*(\S)/
          start_of_word = index($1)
          word = self[start_of_word, self.length]
          # word with capitals and periods mid-word are left alone
          self[start_of_word, 1] = UnicodeUtils.upcase(self[start_of_word, 1]) unless self.has_caps? or word =~ /\.\w+/
        end
        self
      end

      def smart_capitalize!
        replace(smart_capitalize)
      end

      def has_caps?
        return !(UnicodeUtils.downcase(self) == self)
      end

      def all_caps?
        return UnicodeUtils.upcase(self) == self
      end

      def is_big_word?
        BIG_WORDS.include?(self)
      end

      def is_small_word?
        SMALL_WORDS.include?(self)
      end

      def unicode_downcase
        UnicodeUtils.downcase(self)
      end

      def unicode_downcase!
        replace(unicode_downcase)
      end

      def unicode_upcase
        UnicodeUtils.upcase(self)
      end

      def unicode_upcase!
        replace(unicode_upcase)
      end

      def smart_capitalize_ends!(ary)
        # capitalize first and last words
        ary.first.to_s.smart_capitalize!
        # Uncomment the next line if you want the last word to be always initial caps
        ary.last.to_s.smart_capitalize!
      end

      def capitalize_small_words_after_colons(str)
        # small words after colons are capitalized
        str.gsub(/:\s?(\W*#{SMALL_WORDS.join("|")}\W*)\s/) { ": #{$1.smart_capitalize} " }
      end

      def strip_spaces(ary)
        ary - [' ']
      end

      def strip_non_word_chars
        self.gsub(/\W/, "")
      end
    end
  end
end

String.send :include, UnicodeTitlecase::CoreExt::String
