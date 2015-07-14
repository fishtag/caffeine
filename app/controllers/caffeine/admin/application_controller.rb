module Caffeine
  module Admin
    class ApplicationController < CaffeineController
      expose(:pages) { Caffeine::Page.roots_and_descendants_preordered.decorate }
      expose (:main_page) { Caffeine::Page.find_by(%[data -> 'main'= 'true']) }
      expose(:root_pages) { Caffeine::Page.roots }

      helper Caffeine::Engine.helpers

      layout 'layouts/caffeine/admin'
    end
  end
end
