require File.expand_path('../lib/omniauth-suzuri/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Masahiro Saito"]
  gem.email         = ["camelmasa@gmail.com"]
  gem.description   = %q{OmniAuth strategy for SUZURI}
  gem.summary       = %q{OmniAuth strategy for SUZURI.}
  gem.homepage      = "https://github.com/zaikoflow/omniauth-suzuri"
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-suzuri"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::Suzuri::VERSION

  gem.add_dependency 'omniauth', '~> 1.2'
  gem.add_dependency 'omniauth-oauth2', '~> 1.4'
  gem.add_development_dependency "rspec", "~> 3.0"
end
