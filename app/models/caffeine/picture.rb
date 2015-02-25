module Caffeine
  class Picture < ActiveRecord::Base
    belongs_to :imageable, polymorphic: true

    attachment :image
  end
end
