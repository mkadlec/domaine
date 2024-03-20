Gem::Specification.new do |s|
  s.name        = "domaine"
  s.version     = "0.1.0"
  s.summary     = "A simple domain validation for DKIM and SPF records"
  s.description = "A simple domain validation for DKIM and SPF records"
  s.homepage    = "https://github.com/mkadlec/domaine"
  s.authors     = ["Mark Kadlec"]
  s.email       = "mkadlec99@gmail.com"
  s.files       = ["lib/domaine.rb"]
  s.license       = "MIT"

  s.add_development_dependency 'bundler', '~> 2.5.6'
  s.add_development_dependency 'rake', '~> 13.0'
  s.add_development_dependency 'minitest', '~> 5.8'
end