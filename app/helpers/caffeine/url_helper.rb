module Caffeine
  module UrlHelper
    def page_path_for(page)
      path = page.serve_by_slug_only? ? page.slug : page.ancestry_path.join('/')

      url_for("/#{path}")
    end
  end
end
