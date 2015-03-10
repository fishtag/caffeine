module Caffeine
  class Node < ActiveRecord::Base
    include Concerns::Sluggable

    has_closure_tree order: 'position', name_column: 'slug'
  end
end
