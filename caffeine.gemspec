$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'caffeine/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'caffeine'
  s.version     = Caffeine::VERSION
  s.authors     = ['Timur Khafizov']
  s.email       = ['timur.khafizov@fishtag.ru']
  s.homepage    = 'http://github.com/fishtag/caffeine'
  s.summary     = 'Caffeine is KISS CMS on Rails'
  s.description = 'Caffeine is being under heavy development. It should not be used for production apps yet.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 4.2'
  s.add_dependency 'jquery-rails', '~> 4.0.3'
  s.add_dependency 'responders', '~> 2.0'
  s.add_dependency 'closure_tree', '~> 5.2'
  s.add_dependency 'decent_exposure', '~> 2.3'
  s.add_dependency 'slim', '~> 3.0'
  s.add_dependency 'friendly_id', '~> 5.0'
  s.add_dependency 'babosa', '~> 1.0'
  s.add_dependency 'draper', '~> 1.4'
  s.add_dependency 'refile', '> 0.5', '<= 1.0'
  s.add_dependency 'mini_magick', '~> 4.1'
  s.add_dependency 'simple_form', '~> 3.1'
  s.add_dependency 'acts-as-taggable-on', '~> 3.5'
  s.add_dependency 'select2-rails', '~> 3.5'
  s.add_dependency 'simple-line-icons-rails', '~> 0.0.1'
  s.add_dependency 'font-awesome-sass', '~> 4.3.0'
  s.add_dependency 'bootstrap-rails-engine', '~> 3.1.1'
  s.add_dependency 'nav_lynx', '~> 1.1.1'
  s.add_dependency 'cocoon', '~> 1.2.6'
  s.add_dependency 'devise', '~> 3.4'
  s.add_dependency 'coffee-rails', '~> 4.1.0'
  s.add_dependency 'normalize-rails'
  s.add_dependency 'scrollbar-rails', '~> 1.0.0'
  s.add_dependency 'jquery-ui-rails'
  s.add_dependency 'jbuilder'
end
