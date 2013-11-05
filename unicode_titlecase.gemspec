# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'unicode_titlecase/version'

Gem::Specification.new do |gem|
  gem.name          = "unicode_titlecase"
  gem.version       = UnicodeTitlecase::VERSION
  gem.authors       = ["Dr Chong-Yee Khoo"]
  gem.email         = ["mail@cykhoo.com"]
  gem.description   = %q{Gem to enable easy title casing of strings containing Unicode text.}
  gem.summary       = %q{This gem patches the String class to provide a unicode_titlecase method, \
                         which returns a string that is 'title cased': the first letter in each \
                         significant word is in capitals with the rest in lowercase.}
  gem.homepage      = "http://github.com/cantab/unicode_titlecase"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'

  gem.add_runtime_dependency 'unicode_utils'
end
