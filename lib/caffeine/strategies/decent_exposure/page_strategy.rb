module Caffeine
  class PageStrategy < DecentExposure::Strategy
    delegate :redirect_to, to: :controller

    def resource
      instance = model.find_by_path(params[:page_path].split('/'))
      raise ActiveRecord::RecordNotFound unless instance

      instance.decorate
    end
  end
end
