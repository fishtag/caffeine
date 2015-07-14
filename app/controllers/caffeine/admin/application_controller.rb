module Caffeine
  module Admin
    class ApplicationController < CaffeineController
      expose(:pages) { Caffeine::Page.roots_and_descendants_preordered.decorate }
      expose(:root_pages) { Caffeine::Page.roots }

      helper Caffeine::Engine.helpers

      layout 'layouts/caffeine/admin'
    end
  end
end
