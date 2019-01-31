# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'unicode_titlecase/version'

Gem::Specification.new do |spec|
  spec.name          = "unicode_titlecase"
  spec.version       = UnicodeTitlecase::VERSION
  spec.authors       = ["Dr Chong-Yee Khoo"]
  spec.email         = ["mail@cykhoo.com"]

  spec.summary       = %q{Easy title casing of strings containing Unicode text.}
  spec.description   = %q{This gem patches the String class to provide a unicode_titlecase method, \
                         which returns a string that is 'title cased': the first letter in each \
                         significant word is in capitals with the rest in lowercase. Able to handle Unicode text.}
  spec.homepage      = "http://github.com/cantab/unicode_titlecase"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rspec"

  spec.add_runtime_dependency "rake"
  spec.add_runtime_dependency "unicode_utils"
  spec.add_runtime_dependency "gli"
end
