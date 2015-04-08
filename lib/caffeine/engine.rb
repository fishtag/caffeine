require 'caffeine/strategies/decent_exposure/page_strategy'
require 'caffeine/strategies/decent_exposure/tag_strategy'
require 'caffeine/concerns/sluggable'
require 'caffeine/concerns/seo_friendly'

module Caffeine
  class Engine < ::Rails::Engine
    isolate_namespace Caffeine

    config.to_prepare do
      ActiveSupport.on_load :action_controller do
        include Caffeine::Engine.routes.url_helpers
        include Caffeine::UrlHelper
      end
    end
  end
end
