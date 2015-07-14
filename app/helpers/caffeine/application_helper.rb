module Caffeine
  module ApplicationHelper
    def draw_tree(child)
      render partial: 'caffeine/admin/partials/modules/item', locals: {page: child}
      if child.children.any?
        draw_tree(child)
      end
    end

    def draw_childs_tree(children)
      concat (children.collect do |child|
         content_tag(:span, class: 'nav__item--fill') {
                 link_to '#', class: 'title' do
                   content_tag(:i, class: 'fa fa-file-text-o') {
                     child.title
                     if child.children.present?
                       content_for(:span, class: 'count-children') { child.children.count }
                     end
                   }
                 end
                 if child.children.present?
                   content_tag(:span, class: 'more-children action') {
                     content_tag(:span, class: 'action__icon') {
                       content_tag(:i, class: 'iconsfont iconsfont-plus')
                     }
                   }
                 end
               }
                return if child.children.blank?
                draw_childs_tree(child.children)
             end
         ).join("\n")
    end

    def draw_descendants(children)
      html = concat (children.collect do |child|
               render partial: 'caffeine/admin/partials/modules/item', locals: {page: child}
               # return if child.children.blank?
               # draw_descendants(child.children)
             end
       ).join("\n")
      html
    end
  end
end
