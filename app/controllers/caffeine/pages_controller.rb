module Caffeine
  class PagesController < CaffeineController
    expose(:pages)
    expose(:page, strategy: PageStrategy)

    def show
      redirect_to root_path if page.main?
    end
  end
end
