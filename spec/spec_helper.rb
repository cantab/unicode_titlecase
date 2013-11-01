#encoding: UTF-8

require 'unicode_titlecase'
require 'yaml'
require 'rspec'

def run_examples_from_file(filename)

  File.open(File.join(File.dirname(__FILE__), "examples/", *filename)) do |file|
    examples = YAML.load(file)
    examples["should_pass"].each do |e|
      it "#{e["example"]} when titlecased is the expected value (#{e["expect"]})" do
        expect(e["example"].unicode_titlecase).to eq(e["expect"])
      end
    end
  end
end

