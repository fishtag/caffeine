require 'decent_exposure'

module Caffeine
  class PageStrategy < ::DecentExposure::ActiveRecordStrategy
    def resource
      raise ActiveRecord::RecordNotFound unless find_page

      @page.decorate
    end

    protected

    def find_page
      @page = page_scope.size == 1 ? find_by_slug : find_by_path
    end

    def find_by_path
      Page.find_by_path(page_scope)
    end

    def find_by_slug
      Page.find_by(slug: page_scope.first)
    end

    def page_scope
      params[:page_id].split('/')
    end
  end
end
