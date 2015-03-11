module Caffeine
  class MainPageController < CaffeineController
    expose(:page) { Page.main_pages.first.decorate }

    def index
      render template: 'caffeine/pages/show'
    end
  end
end
