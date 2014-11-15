# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "chawan/version"

Gem::Specification.new do |spec|
  spec.name          = "chawan"
  spec.version       = Chawan::VERSION
  spec.authors       = ["johnny"]
  spec.email         = ["takuma.miyake@framgia.com"]
  spec.summary       = %q{A Chatwork API client library}
  spec.description   = %q{Please see README.md}
  spec.homepage      = "https://github.com/johnny-miyake/chawan"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1", ">= 3.1.0"
  spec.add_dependency "faraday", "~> 0.9", ">= 0.9.0"
  spec.add_dependency "json", "~> 1.8", ">= 1.8.1"
end
