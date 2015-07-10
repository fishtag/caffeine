module Caffeine
  class Picture < ActiveRecord::Base
    class_attribute :permitted_attributes
    self.permitted_attributes = %i(id image title caption position description _destroy)

    belongs_to :imageable, polymorphic: true

    attachment :image

    acts_as_taggable
  end
end
