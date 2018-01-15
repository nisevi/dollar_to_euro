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

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency('rdoc')
  spec.add_development_dependency('aruba')
  spec.add_dependency('methadone', '~> 1.9.5')
  spec.add_development_dependency('test-unit')
  spec.add_development_dependency('rspec', '~> 3')
  spec.add_development_dependency('byebug', '~> 9.1')
  spec.add_dependency('sidekiq', '~> 5.0')
  spec.add_dependency('whenever', '~> 0.10.0')
  spec.add_dependency('mongoid', '~> 6.1.0')
  spec.add_dependency('dotenv', '~> 2.2')
  spec.add_dependency('holidays', '~> 6.3')
end
