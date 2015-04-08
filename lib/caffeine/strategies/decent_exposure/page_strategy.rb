require 'decent_exposure'

module Caffeine
  class PageStrategy < ::DecentExposure::ActiveRecordStrategy
    def resource
      instance = ::Caffeine::Page.find_by_path(params[:page_id].split('/'))
      raise ActiveRecord::RecordNotFound unless instance

      instance.decorate
    end
  end
end
