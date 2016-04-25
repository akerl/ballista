Gem::Specification.new do |s|
  s.name        = 'ballista'
  s.version     = '0.0.1'
  s.date        = Time.now.strftime('%Y-%m-%d')

  s.summary     = 'Projection tool for Ledger format'
  s.description = "Projection tool for Ledger format"
  s.authors     = ['Les Aker']
  s.email       = 'me@lesaker.org'
  s.homepage    = 'https://github.com/akerl/ballista'
  s.license     = 'MIT'

  s.files       = `git ls-files`.split
  s.test_files  = `git ls-files spec/*`.split
  s.executables = ['ballista']

  s.add_development_dependency 'rubocop', '~> 0.35.0'
  s.add_development_dependency 'rake', '~> 10.4.0'
  s.add_development_dependency 'codecov', '~> 0.1.1'
  s.add_development_dependency 'rspec', '~> 3.4.0'
  s.add_development_dependency 'fuubar', '~> 2.0.0'
end
