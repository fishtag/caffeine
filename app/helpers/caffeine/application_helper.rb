module Caffeine
  module ApplicationHelper
    def favicon_path
      has_asset?('favicon') ? 'favicon' : 'caffeine/admin/icons/favicon'
    end

    def has_asset?(path)
      !!Rails.application.assets.resolve(path)
    end

    def draw_descendants(children)
      children.collect { |page|
        concat render 'caffeine/admin/partials/modules/nav_pages/item', page: page
        if page.children.any?
           content_tag(:ul, class: 'nav__list nav__list--sub') {
                 draw_descendants(page.children)
               }
        end
      }.join("\n")
    end
  end
end
