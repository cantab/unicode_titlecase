#encoding: UTF-8

require 'unicode_utils'

module UnicodeTitlecase
  module CoreExt
    module String

      def unicode_titlecase
        # List of exceptions: small_words are words that should always be in lowercase; big_words are words that should always be in uppercase
        small_words = %w(a an and as at but by be for if in is of on or the to v v. via vs vs.)
        big_words = %w(AB A.B. A/B AS A.S. A/S S.A. KG DNA RNA HBV HIV I II III IV V VI VII VIII IX X AC DC Q&A AT&T)

        x = split(" ").map do |word|
          # note: word could contain non-word characters!
          # downcase all small_words, upcase all big words, smart capitalize the rest

          word.replace(UnicodeUtils.downcase(word)) if word.all_caps? and not big_words.include?(word)

          if small_words.include?(UnicodeUtils.downcase(word.gsub(/\W/, "")))
            word.replace(UnicodeUtils.downcase(word))
          else
            if big_words.include?(UnicodeUtils.upcase(word.gsub(/\W/, "")))
              word.replace(UnicodeUtils.upcase(word))
            else
              word.smart_capitalize!
            end
          end
        end

        x = x - [' ']

        # capitalize first and last words
        x.first.to_s.smart_capitalize!
        # Uncomment the next line if you want the last word to be always initial caps
        x.last.to_s.smart_capitalize!

        # small words after colons are capitalized
        x.join(" ").gsub(/:\s?(\W*#{small_words.join("|")}\W*)\s/) { ": #{$1.smart_capitalize} " }
      end

      def unicode_titlecase!
        replace(unicode_titlecase)
      end

      def smart_capitalize
        # ignore any leading crazy characters and capitalize the first real character
        if self =~ /^['"\(\[']*(\S)/
          i = index($1)
          x = self[i,self.length]
          # word with capitals and periods mid-word are left alone
          self[i,1] = UnicodeUtils.upcase(self[i,1]) unless self.has_caps? or x =~ /\.\w+/
        end
        self
      end

      def smart_capitalize!
        replace(smart_capitalize)
      end

      def has_caps?
        return !UnicodeUtils.downcase(self) == self
      end

      def all_caps?
        return UnicodeUtils.upcase(self) == self
      end

    end
  end
end

String.send :include, UnicodeTitlecase::CoreExt::String
