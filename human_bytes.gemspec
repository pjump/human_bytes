# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'human_bytes/version'

Gem::Specification.new do |spec|
  spec.name          = "human_bytes"
  spec.version       = HumanBytes::VERSION
  spec.authors       = ["Petr Skocik"]
  spec.email         = ["pskocik@gmail.com"]

  spec.summary       = %q{Convert bytesizes into a human-readable format}
  spec.description   = %q{Either uses decimal byte prefixes or prefixes based on powers of 2 (Ki, Mi, etc.).}
  spec.homepage      = "https://github.com/pjump/human_bytes"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'flt'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "rspec-mocks"
end
