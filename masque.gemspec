# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'masque/version'

Gem::Specification.new do |gem|
  gem.name          = "masque"
  gem.version       = Masque::VERSION
  gem.authors       = ["uu59"]
  gem.email         = ["k@uu59.org"]
  gem.description   = %q{JavaScript enabled web crawler kit}
  gem.summary       = %q{JavaScript enabled web crawler kit}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency "capybara" # maybe 2.1.0
  gem.add_development_dependency "headless"
  gem.add_development_dependency "capybara-webkit", "~> 1.0.0"
  gem.add_development_dependency "poltergeist", "~> 1.3.0"
  gem.add_development_dependency "rspec", "~> 2.11"
  gem.add_development_dependency "sinatra"
  gem.add_development_dependency "simplecov"
  gem.add_development_dependency "multi_json"
end
