module Caffeine
  class Album < ActiveRecord::Base
    belongs_to :page
    has_many :pictures, as: :imageable
  end
end
