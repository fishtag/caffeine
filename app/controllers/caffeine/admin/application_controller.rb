module Caffeine
  module Admin
    class ApplicationController < CaffeineController
      expose(:pages) { Caffeine::Page.roots_and_descendants_preordered.decorate }

      helper Caffeine::Engine.helpers

      layout 'layouts/caffeine/admin'
    end
  end
end
