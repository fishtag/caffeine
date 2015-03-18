require 'caffeine/strategies/decent_exposure/page_strategy'
require 'caffeine/strategies/decent_exposure/tag_strategy'
require 'caffeine/concerns/sluggable'
require 'caffeine/concerns/seo_friendly'

module Caffeine
  class Engine < ::Rails::Engine
    isolate_namespace Caffeine
  end
end
