module Caffeine
  class Page < Node
    class_attribute :permitted_attributes
    self.permitted_attributes = Caffeine::Node.permitted_attributes +
        %i(main content summary tag_list serve_by_slug_only) <<
        { pictures_attributes: Caffeine::Picture.permitted_attributes }

    include Caffeine::Concerns::SeoFriendly
    include ActionView::Helpers::SanitizeHelper

    store_accessor :data, :main, :content, :summary, :serve_by_slug_only

    has_many :pictures, -> { order(:position) }, as: :imageable
    accepts_nested_attributes_for :pictures, allow_destroy: true

    # enum status: %i(draft published blocked)

    validates :title, presence: true

    # triggered unless page is not itself and is not selected as the main page
    before_save :drop_other_main, on: %i(create update destroy), if: ->(page) { page.main? }
    before_save :sanitize_title, on: %i(create update)

    scope :main_pages, -> { where(%[data -> 'main'= 'true']) }

    acts_as_ordered_taggable

    def main?
      main
    end

    def serve_by_slug_only?
      ActiveRecord::Type::Boolean.new.type_cast_from_database(serve_by_slug_only)
    end

    private

    def sanitize_title
      self.title = strip_tags self.title
    end

    def drop_other_main
      self.class.main_pages.where.not(id: self.id).map do |page|
        page.main = false
        page.save
      end
    end
  end
end
