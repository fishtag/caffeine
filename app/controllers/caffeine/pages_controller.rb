module Caffeine
  class PagesController < ApplicationController
    expose(:pages)
    expose(:page)

    def show
      current_page = Page.find_by_path(params[:page_path].split('/'))

      raise ActiveRecord::RecordNotFound unless current_page
      redirect_to root_path if current_page.main?

      self.page = current_page.decorate
    end
  end
end
