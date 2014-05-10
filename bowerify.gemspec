# coding: utf-8
$:.push File.expand_path("../lib", __FILE__)
require 'bowerify/version'

Gem::Specification.new do |spec|
  spec.name          = "bowerify"
  spec.version       = Bowerify::VERSION
  spec.authors       = ["Nikolay Nemshilov"]
  spec.email         = ["nemshilov@gmail.com"]
  spec.description   = "Bower components handler for sprockets"
  spec.summary       = "Bower components handler for sprockets and rails"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "sprockets"
end
