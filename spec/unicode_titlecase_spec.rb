require 'spec_helper'

describe String do

  let(:string) { 'the rain in spain' }

  describe "unicode_titlecase method" do

    it "returns a title cased version of the string" do
      expect(string.unicode_titlecase).to eq('The Rain in Spain')
    end

    it "does not modify the original string" do
      string.unicode_titlecase
      expect(string).to eq('the rain in spain')
    end
  end

  describe "unicode_titlecase! method" do

    it "returns a title cased version of the string" do
      expect(string.unicode_titlecase!).to eq('The Rain in Spain')
    end

    it "self-modifies the original value in place" do
      string.unicode_titlecase!
      expect(string).to eq('The Rain in Spain')
    end
  end

  describe "examples" do

    describe "bigword examples" do
      run_examples_from_file('bigword_examples.yaml')
    end

    describe "capitalisation examples" do
      run_examples_from_file('capitalisation_examples.yaml')
    end

    describe "smallword examples" do
      run_examples_from_file('smallword_examples.yaml')
    end

    describe "standard examples" do
      run_examples_from_file('standard_examples.yaml')
    end

    describe "unicode examples" do
      run_examples_from_file('unicode_examples.yaml')
    end
  end
end
