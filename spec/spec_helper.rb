require 'unicode_titlecase'
require 'rspec'

def run_examples_from_file(filename)

  File.open(File.join(File.dirname(__FILE__), *filename)) do |file|
    examples = YAML.load(file)
    examples["should_pass"].each do |e|
      it "should be the expected value (#{e["expect"]})" do
        e["example"].titlecase.should == e["expect"]
      end
    end
  end
end

