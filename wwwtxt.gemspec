# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wwwtxt/version'

Gem::Specification.new do |spec|
  spec.name          = "wwwtxt"
  spec.version       = WwwTxt::VERSION
  spec.authors       = ["Ryan Muller"]
  spec.email         = ["cognitionmachine@gmail.com"]
  spec.summary       = %q{CLI for downloading websites as plain text}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_runtime_dependency "gli", "2.7.0"
  spec.add_runtime_dependency "htmlentities"
  spec.add_runtime_dependency "ruby-readability"
  spec.add_runtime_dependency "open_uri_redirections"
end
