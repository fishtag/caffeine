module Caffeine
  module Admin
    class ApplicationController < CaffeineController
      helper Caffeine::Engine.helpers

      layout 'layouts/caffeine/admin'
    end
  end
end
