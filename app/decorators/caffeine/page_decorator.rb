module Caffeine
  class PageDecorator < Draper::Decorator
    delegate_all
    decorates_association :children

    TEMPLATE_FILE_NAME = 'template'
    DEFAULT_TEMPLATE = "templates/default/#{TEMPLATE_FILE_NAME}"

    # First we check if page has an own dedicated template
    # Then we check if page has parents and their children template
    # Finally we take default template
    def page_template
      self_custom_template || parent_children_template || DEFAULT_TEMPLATE
    end

    def self_custom_template
      "templates/#{slug}/#{TEMPLATE_FILE_NAME}" if self_custom_template_exists?
    end

    def self_custom_template_exists?
      File.exist?("app/views/pages/templates/#{slug}/_#{TEMPLATE_FILE_NAME}.html.slim")
    end

    def parent_children_template
      "templates/#{parents_path}/children_#{TEMPLATE_FILE_NAME}" if parent_children_template_exists?
    end

    def parent_children_template_exists?
      File.exist?("app/views/pages/templates/#{parents_path}/_children_#{TEMPLATE_FILE_NAME}.html.slim")
    end

    # returns something similar to 'grandparent/parent'
    def parents_path
      object.ancestry_path.tap(&:pop).join('/')
    end

    def admin_list_classes
      offset = page.depth
      width = 12 - object.depth

      "col-md-#{width} col-md-offset-#{offset} col-xs-#{width} col-xs-offset-#{offset}"
    end

    def admin_row_classes
      page.root? ? 'widget' : 'widget no-margin--t no-border--t'
    end
  end
end
