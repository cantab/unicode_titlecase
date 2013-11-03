#encoding: UTF-8

require 'spec_helper'

describe String do

  describe "has_caps? method" do

    context "word with capital letter" do

      it "identifies it as having caps" do
        string = 'fluVial'
        expect(string.has_caps?).to be_true
      end
    end

    context "word without capital letter" do

      it "identifies it has not having caps" do
        string = 'fluvial'
        expect(string.has_caps?).to be_false
      end
    end
  end

  describe "all_caps? method" do

    context "word completely in uppercase" do

      it "identifies it as having all caps" do
        string = 'FLUVIAL'
        expect(string.all_caps?).to be_true
      end
    end

    context "word not completely in uppercase" do

      it "identifies it has not having all caps" do
        string = 'FLUvIAL'
        expect(string.all_caps?).to be_false
      end
    end

    context "word in lowercase" do

      it "identifies it has not having all caps" do
        string = 'fluvial'
        expect(string.all_caps?).to be_false
      end
    end
  end

  describe "is_big_word? method" do

    context "word in big words list" do

      it "identifies it as being a big word" do
        string = 'HIV'
        expect(string.is_big_word?).to be_true
      end
    end

    context "word not in big words list" do

      it "identifies it as not being a big word" do
        string = 'SIV'
        expect(string.is_big_word?).to be_false
      end
    end
  end

  describe "is_small_word? method" do

    context "word in small words list" do

      it "identifies it as being a small word" do
        string = 'is'
        expect(string.is_small_word?).to be_true
      end
    end

    context "word not in small words list" do

      it "identifies it as not being a small word" do
        string = 'tis'
        expect(string.is_small_word?).to be_false
      end
    end
  end

  describe "unicode_downcase method" do

    it "downcases the word" do
      string = 'Dżdżyste'
      expect(string.unicode_downcase).to eq('dżdżyste')
    end
  end

  describe "unicode_downcase! method" do

    it "downcases the word in place" do
      string = 'Dżdżyste'
      string.unicode_downcase!
      expect(string).to eq('dżdżyste')
    end
  end

  describe "unicode_upcase method" do

    it "upcases the word" do
      string = 'dżdżyste'
      expect(string.unicode_upcase).to eq('DŻDŻYSTE')
    end
  end

  describe "unicode_upcase! method" do

    it "upcases the word in place" do
      string = 'dżdżyste'
      string.unicode_upcase!
      expect(string).to eq('DŻDŻYSTE')
    end
  end

  describe "smart_capitalize method" do

    context "word with leading single quote mark" do

      it "capitalizes word properly" do
        expect("'fluvial".smart_capitalize).to eq("'Fluvial")
      end

      context "and internal capital letter" do
        it "is left alone" do
          expect("'flUvial".smart_capitalize).to eq("'flUvial")
        end
      end

      context "and internal period" do
        it "is left alone" do
          expect("'fl.vial".smart_capitalize).to eq("'fl.vial")
        end
      end
    end

    context "word with leading double quote mark" do

      it "capitalizes word properly" do
        expect('"fluvial'.smart_capitalize).to eq('"Fluvial')
      end

      context "and internal capital letter" do
        it "is left alone" do
          expect('"flUvial'.smart_capitalize).to eq('"flUvial')
        end
      end

      context "and internal period" do
        it "is left alone" do
          expect('"fl.vial'.smart_capitalize).to eq('"fl.vial')
        end
      end
    end

    context "word with leading open bracket" do
      it "capitalizes word properly" do
        expect('(fluvial'.smart_capitalize).to eq('(Fluvial')
      end

      context "and internal capital letter" do
        it "is left alone" do
          expect('(flUvial'.smart_capitalize).to eq('(flUvial')
        end
      end

      context "and internal period" do
        it "is left alone" do
          expect('(fl.vial'.smart_capitalize).to eq('(fl.vial')
        end
      end
    end

    context "word with leading open square bracket" do
      it "capitalizes word properly" do
        expect('[fluvial'.smart_capitalize).to eq('[Fluvial')
      end

      context "and internal capital letter" do
        it "is left alone" do
          expect('[flUvial'.smart_capitalize).to eq('[flUvial')
        end
      end

      context "and internal period" do
        it "is left alone" do
          expect('[fl.vial'.smart_capitalize).to eq('[fl.vial')
        end
      end
    end

    describe "smart_capitalize_ends! method" do

      it "capitalizes first and last members of an array of words" do
        array = ['fee', 'fi', 'fo', 'fum']
        String.new.smart_capitalize_ends!(array)
        expect(array).to eq(['Fee', 'fi', 'fo', 'Fum'])
      end
    end

    describe "capitalize_small_words_after_colons method" do

      it "capitalizes small words after colons" do
        string = 'end: a begining'
        expect(String.new.capitalize_small_words_after_colons(string)).to eq('end: A begining')
      end
    end

    describe "strip_spaces method" do

      it "strips members of array which are spaces" do
        array = ['the', ' ', 'rain', ' ', 'in', ' ', 'spain', ' ']
        expect(String.new.strip_spaces(array)).to eq(['the', 'rain', 'in', 'spain'])
      end
    end

    describe "strip_non_word_chars method" do

      it "strips characters in a string which are not words" do
        string = "T!h\"e r£ai$n i%n Spa^in st&*a(y)s ma-in=!ly in t@+he p{}l[]ai#n"
        expect(string.strip_non_word_chars).to eq("TheraininSpainstaysmainlyintheplain")
      end
    end
  end
end
