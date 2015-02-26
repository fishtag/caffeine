$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'caffeine/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'caffeine'
  s.version     = Caffeine::VERSION
  s.authors     = ['Timur Khafizov']
  s.email       = ['timur.khafizov@fishtag.ru']
  s.homepage    = 'TODO'
  s.summary     = 'TODO: Summary of Caffeine.'
  s.description = 'TODO: Description of Caffeine.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 4.2.0'
  s.add_dependency 'responders', '~> 2.0'
  s.add_dependency 'closure_tree', '~> 5.2.0'
  s.add_dependency 'decent_exposure', '~> 2.3.2'
  s.add_dependency 'slim', '~> 3.0.2'
  s.add_dependency 'friendly_id', '~> 5.0'
  s.add_dependency 'babosa', '~> 1.0'
  s.add_dependency 'closure_tree', '~> 5.2.0'
  s.add_dependency 'draper', '~> 1.4.0'
  s.add_dependency 'refile', '> 0.5', '<= 1.0'
  s.add_dependency 'mini_magick', '~> 4.1'
  s.add_dependency 'simple_form', '~> 3.1'
end
