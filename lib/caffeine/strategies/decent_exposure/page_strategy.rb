module Caffeine
  class PageStrategy < ::DecentExposure::ActiveRecordStrategy
    def resource
      instance = ::Caffeine::Page.find_by_path(page_path.split('/'))
      raise ActiveRecord::RecordNotFound unless instance

      instance.decorate
    end

    protected

    def page_path
      params[:page_id] || params[:id]
    end
  end
end
