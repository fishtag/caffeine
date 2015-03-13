module Caffeine
  module Concerns
    module SeoFriendly
      extend ActiveSupport::Concern

      included do
        if defined?(::ActsAsSeoFriendly)
          acts_as_seo_friendly

          after_initialize :build_seo_datum, if: ->(obj) { obj.seo_datum.blank? }

          self.permitted_attributes << { seo_datum_attributes: ::ActsAsSeoFriendly::SeoDatum::PERMITTED_ATTRIBUTES }
        end
      end
    end
  end
end
