require 'spec_helper'
require "yaml"

describe String do

  run_examples_from_file('standard_examples.yaml')

  run_examples_from_file('unicode_examples.yaml')

  # Ensure the self-modifying version works correctly
  it "should self-modify the original value in place" do
    string = 'a complex thing'
    string.unicode_titlecase!
    string.should == 'A Complex Thing'
  end
end
