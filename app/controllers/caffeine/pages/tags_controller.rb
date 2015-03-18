module Caffeine
  module Pages
    class TagsController < CaffeineController
      expose(:page_tag, strategy: TagStrategy, model: ::ActsAsTaggableOn::Tag)
      expose(:page, strategy: PageStrategy)
      expose(:pages_tagged) { Page.tagged_with(page_tag.name).with_ancestor(page) }

      def show
      end
    end
  end
end
