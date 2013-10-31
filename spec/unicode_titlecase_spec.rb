require 'spec_helper'
require "yaml"

describe String do

  run_examples_from_file('standard_examples.yaml')

  run_examples_from_file('unicode_examples.yaml')

  run_examples_from_file('capitalisation_examples.yaml')

  describe "unicode_titlecase method" do
    it "does not modify the original string" do
      string = 'a complex thing'
      string.unicode_titlecase
      expect(string).to eq('a complex thing')
      expect(string).to_not eq('A Complex Thing')
    end
  end

  describe "unicode_titlecase! method" do
    it "self-modifies the original value in place" do
      string = 'a complex thing'
      string.unicode_titlecase!
      expect(string).to eq('A Complex Thing')
      expect(string).to_not eq('a complex thing')
    end
  end
end
