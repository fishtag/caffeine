module Caffeine
  module ApplicationHelper
    def favicon_path
      path = has_asset?('favicon') ? 'favicon' : 'caffeine/admin/icons/favicon'
      image_path(path)
    end

    def has_asset?(path)
      Rails.application.assets.find_asset(path).present?
    end
  end
end
