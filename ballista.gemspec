require 'English'
$LOAD_PATH.unshift File.expand_path('lib', __dir__)
require 'ballista/version'

Gem::Specification.new do |s|
  s.name        = 'ballista'
  s.version     = Ballista::VERSION
  s.date        = Time.now.strftime('%Y-%m-%d')

  s.summary     = 'Projection tool for Ledger format'
  s.description = 'Projection tool for Ledger format'
  s.authors     = ['Les Aker']
  s.email       = 'me@lesaker.org'
  s.homepage    = 'https://github.com/akerl/ballista'
  s.license     = 'MIT'

  s.files       = `git ls-files`.split
  s.test_files  = `git ls-files spec/*`.split
  s.executables = ['ballista']

  s.add_dependency 'cymbal', '~> 2.0.0'
  s.add_dependency 'libledger', '~> 0.0.1'
  s.add_dependency 'mercenary', '~> 0.3.4'

  s.add_development_dependency 'codecov', '~> 0.1.1'
  s.add_development_dependency 'fuubar', '~> 2.3.0'
  s.add_development_dependency 'goodcop', '~> 0.6.0'
  s.add_development_dependency 'rake', '~> 12.3.0'
  s.add_development_dependency 'rspec', '~> 3.8.0'
  s.add_development_dependency 'rubocop', '~> 0.63.0'
end
