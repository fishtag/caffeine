module Caffeine
  module NavigationHelper
    def admin_nav_link_to(path, icon:, title:)
      nav_link_to path, {}, selected_class: 'active', wrapper: 'li' do
        concat content_tag(:i, nil, class: "icon-#{icon}")
        concat content_tag(:span, class: 'title') { title.mb_chars.capitalize.to_s }
      end
    end
  end
end
