require 'caffeine/concerns/sluggable'
require 'caffeine/strategies/decent_exposure/page_strategy'

module Caffeine
  class Engine < ::Rails::Engine
    isolate_namespace Caffeine
  end
end
