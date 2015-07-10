module Caffeine
  class Node < ActiveRecord::Base
    include Caffeine::Concerns::Sluggable

    class_attribute :permitted_attributes
    self.permitted_attributes = %i(title slug position parent_id)

    has_closure_tree order: 'position', name_column: 'slug'
  end
end
