begin
  require 'acts_as_seo_friendly'
rescue LoadError
  puts %[[Caffeine] Gem 'acts_as_seo_friendly' is missing. Skipping seo datum definition for Page]
end
require 'responders'
require 'decent_exposure'
require 'slim'
require 'closure_tree'
require 'draper'
require 'refile/rails'
require 'refile/image_processing'
require 'simple_form'
require 'acts-as-taggable-on'
require 'simple-line-icons-rails'
require 'select2-rails'
require 'font-awesome-rails'
require 'jquery-rails'
require 'bootstrap-rails-engine'
require 'nav_lynx'
require 'cocoon'
require 'scrollbar-rails'
require 'normalize-rails'
require 'jquery-ui-rails'
require 'devise'
require 'caffeine/engine'

module Caffeine
end
