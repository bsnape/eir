# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'uri/health/version'

Gem::Specification.new do |spec|
  spec.name          = 'uri-health'
  spec.version       = Uri::Health::VERSION
  spec.authors       = ['Ben Snape']
  spec.email         = ["ben.snape@itv.com"]
  spec.summary       = %q{Monitor the health of URI's}
  spec.description   = %q{Easily monitor the health of arbitrary URI's defined in YAML config}
  spec.homepage      = 'http://www.bensnape.com'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
