require 'spec_helper'
require "yaml"

describe String do

  # run_examples_from_file('standard_examples.yaml')

  # run_examples_from_file('unicode_examples.yaml')

  run_examples_from_file('capitalisation_examples.yaml')

  # Ensure the self-modifying version works correctly
  it "should self-modify the original value in place" do
    string = 'a complex thing'
    string.unicode_titlecase!
    string.should == 'A Complex Thing'
  end

  describe "Regex for splitting words works correctly" do

    subject { "My life with A.B. and the dogs" }

    it "should not split on A.B" do
        small_words = %w(a an and as at but by be for if in is of on or the to v v. via vs vs.)
        big_words = %w(AB A.B. A/B AS A.S. A/S S.A. DNA RNA HBV HIV I II III IV V VI VII VIII IX X AC DC Q&A AT&T)

        words = subject.split_to_words
        words.should include("A.B.") 
        puts words
     end
  end
end
