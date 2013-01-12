# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'unicode_titlecase/version'

Gem::Specification.new do |gem|
  gem.name          = "unicode_titlecase"
  gem.version       = UnicodeTitlecase::VERSION
  gem.authors       = ["Chong-Yee Khoo"]
  gem.email         = ["mail@cykhoo.com"]
  gem.description   = %q{Titlecaser with Unicode smarts, based on samsouder/titlecase}
  gem.summary       = %q{Change text, including in Unicode, to title case}
  gem.homepage      = "http://github.com/cykhoo/unicode_titlecase"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'

  gem.add_runtime_dependency 'unicode_utils'
end
