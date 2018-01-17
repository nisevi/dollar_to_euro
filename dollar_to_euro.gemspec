lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dollar_to_euro/version'

Gem::Specification.new do |spec|
  spec.name          = 'dollar_to_euro'
  spec.license       = 'APACHE'
  spec.version       = DollarToEuro::VERSION
  spec.authors       = ['nisevi']
  spec.email         = ['nicolas.s.vidal@gmail.com']
  spec.summary       = 'Convert dollar to euro.'
  spec.description   = 'Convert dollar to euro.'
  spec.homepage      = 'https://github.com/nisevi/dollar_to_euro'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'aruba'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'byebug'
  spec.add_dependency 'holidays'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rdoc'
  spec.add_dependency 'methadone'
  spec.add_dependency 'mongoid'
  spec.add_development_dependency 'rspec'
  spec.add_dependency 'sidekiq'
  spec.add_development_dependency 'simplecov'
  spec.add_dependency 'whenever'
end
