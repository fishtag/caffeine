require 'decent_exposure'

module Caffeine
  class TagStrategy < ::DecentExposure::ActiveRecordStrategy
    def resource
      instance = model.find_by(name: id)
      raise ActiveRecord::RecordNotFound unless instance

      instance
    end
  end
end
