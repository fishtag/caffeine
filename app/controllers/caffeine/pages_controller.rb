module Caffeine
  class PagesController < ApplicationController
    expose(:pages)
    expose(:page, strategy: PageStrategy)

    def show
      redirect_to root_path if page.main?
    end
  end
end
