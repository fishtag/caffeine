require 'caffeine/concerns/sluggable'
require 'caffeine/strategies/decent_exposure/page_strategy'

module Caffeine
  class Engine < ::Rails::Engine
    config.assets.precompile += %w(bootstrap/bootstrap.min.css bootstrap/bootstrap.min.js)
    config.assets.precompile += %w(jquery2.js)

    isolate_namespace Caffeine
  end
end
