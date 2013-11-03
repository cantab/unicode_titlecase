require 'spec_helper'

describe String do

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
  end

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
end
