module Caffeine
  class PageDecorator < Draper::Decorator
    include Draper::LazyHelpers
    delegate_all
    decorates_association :children, with: Caffeine::PageDecorator

    TEMPLATE_DIR = 'app/views/caffeine/pages/templates'
    TEMPLATE_NAME = 'template'
    CHILDREN_TEMPLATE_NAME = "children_#{TEMPLATE_NAME}"
    DEFAULT_TEMPLATE = "templates/default/#{TEMPLATE_NAME}"

    # First we check if page has an own dedicated template
    # Then we check if page has parents and their children template
    # Finally we take default template
    def page_template
      self_template || inherited_template || DEFAULT_TEMPLATE
    end

    def self_template
      "templates/#{slug}/#{TEMPLATE_NAME}" if self_template_exists?
    end

    def self_template_exists?
      File.exist?("#{TEMPLATE_DIR}/#{slug}/_#{TEMPLATE_NAME}.html.slim")
    end

    def inherited_template
      @inherited_template ||= search_inherited_template
    end

    # Returns page's first picture.
    # Assuming page has many pictures ordered by position we use the first picture as main
    def main_picture
      @main_picture ||= object.pictures.first
    end

    def alias_link
      link = "#{request.protocol}#{request.host}/"
      if current_page?(action: 'new')
        content_tag(:span, class: 'domain') { link }
      else
        link = build_link(object, link)
        link_to link, page_path(object), class: 'domain', target: '_blank'
      end
    end

    private

    def build_link(page, link)
      (page.serve_by_slug_only? || page.main) ? link : "#{link}#{page.parent.slug}/"
    end

    # This method checks if parent has template for its (grand)children
    def search_inherited_template
      # Get full ancestry path for current page
      parent_slugs = object.ancestry_path

      # Iterate over all parents:
      # 1. Generate template path:
      #     ['grandparent', 'parent', 'current_page'] => 'grandparent/parent'
      # 2. Check if template for children exists:
      #     'app/views/pages/templates/grandparent/parent/_children_template.html.slim'
      # 3. Return it's name if exist or iterate again without closest parent
      while (template_dir = parent_slugs.tap(&:pop).join('/')).present?
        if File.exist?("#{TEMPLATE_DIR}/#{template_dir}/_#{CHILDREN_TEMPLATE_NAME}.html.slim")
          inherited_template = "templates/#{template_dir}/#{CHILDREN_TEMPLATE_NAME}"
          break
        end
      end

      inherited_template
    end
  end
end
