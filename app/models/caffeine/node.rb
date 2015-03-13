module Caffeine
  class Node < ActiveRecord::Base
    module PermittedAttributes
      PERMITTED_ATTRIBUTES = %i(title slug position parent_id)
    end

    include PermittedAttributes
    include Caffeine::Concerns::Sluggable

    has_closure_tree order: 'position', name_column: 'slug'
  end
end
