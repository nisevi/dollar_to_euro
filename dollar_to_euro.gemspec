# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dollar_to_euro/version'

Gem::Specification.new do |spec|
  spec.name          = 'dollar_to_euro'
  spec.license       = 'Apache-2.0'
  spec.version       = DollarToEuro::VERSION
  spec.authors       = ['Nicolas Sebastian Vidal']
  spec.email         = ['nicolas.s.vidal@gmail.com']
  spec.summary       = 'Convert dollar to euro.'
  spec.description   = 'Command line tool to convert dollars to euros.'
  spec.homepage      = 'https://github.com/nisevi/dollar_to_euro'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.5.0'

  spec.add_development_dependency 'aruba', '~> 0.14.3'
  spec.add_development_dependency 'bundler', '~> 1.16', '>= 1.16.1'
  spec.add_development_dependency 'byebug', '~> 10.0'
  spec.add_development_dependency 'rake', '~> 12.3'
  spec.add_development_dependency 'rdoc', '~> 6.0', '>= 6.0.1'
  spec.add_dependency 'methadone', '~> 1.9', '>= 1.9.5'
  spec.add_dependency 'mongoid', '>= 6.2.1', '< 8.0'
  spec.add_development_dependency 'rspec', '~> 3.7'
  spec.add_development_dependency 'simplecov', '~> 0.16.1'
  spec.add_dependency 'whenever', '~> 0.10.0'
  spec.add_dependency 'whenever-test', '~> 1.0', '>= 1.0.1'
end
