module Caffeine
  class Album < ActiveRecord::Base
    belongs_to :page
  end
end
