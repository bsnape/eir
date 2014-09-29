# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'eir/version'

Gem::Specification.new do |spec|
  spec.name        = 'eir'
  spec.version     = Eir::VERSION
  spec.authors     = ['Ben Snape']
  spec.email       = %w(bsnape@gmail.com)
  spec.summary     = %w{Monitor the health of URI's}
  spec.description = %w{Easily monitor the health of arbitrary URI's defined in YAML config}
  spec.homepage    = 'http://www.bensnape.com'
  spec.license     = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = %w(lib)

  spec.add_dependency 'rest-client', '~> 1.6.7'
  spec.add_dependency 'sinatra', '~> 1.4.5'
  spec.add_dependency 'haml', '~> 4'
  spec.add_dependency 'puma', '~> 2.8.2'
  spec.add_dependency 'colorize', '~> 0.7.3'

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake', '~> 10'
  spec.add_development_dependency 'rspec', '~> 2'
  spec.add_development_dependency 'rack-test', '~> 0.6.2'
end
