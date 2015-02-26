# This module prepare FriendlyId settings for including to model
#
# example:
#
# class ModelName < ActiveRecord::Base
# include Sluggable         # including our module
# slug_with :field_name    # set sluggable field, optional, slug with :title by default
# ...
# end
require 'babosa'
require 'friendly_id'

module Caffeine
  module Concerns
    module Sluggable
      extend ActiveSupport::Concern

      included do
        # create class variable which contains models sluggable attribute name
        class_attribute :sluggable_attribute

        extend FriendlyId

        # set default value of sluggable attribute
        slug_with :title

        def normalize_friendly_id(input)
          input.to_s.to_slug.normalize(transliterations: :russian).to_s
        end

        def should_generate_new_friendly_id?
          slug.blank?
        end
      end

      module ClassMethods
        # set sluggable field
        def slug_with(attribute)
          self.sluggable_attribute = attribute

          friendly_id sluggable_attribute, use: :slugged
        end
      end
    end
  end
end
