module Caffeine
  class Picture < ActiveRecord::Base
    belongs_to :imageable, polymorphic: true

    attachment :image

    acts_as_taggable
  end
end
