# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jp_ski/version'

Gem::Specification.new do |spec|
  spec.name          = "jp_ski"
  spec.version       = JpSki::VERSION
  spec.authors       = ["tsmsogn"]
  spec.email         = ["tsmsogn@gmail.com"]
  spec.summary       = %q{JpSki is utils for Japan ski resorts.}
  spec.description   = %q{JpSki is utils for Japan ski resorts.}
  spec.homepage      = "https://github.com/tsmsogn/jp_ski"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "attr_required", "1.0.1"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
