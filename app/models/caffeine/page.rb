module Caffeine
  class Page < Node
    PERMITTED_ATTRIBUTES = Caffeine::Node::PERMITTED_ATTRIBUTES + %i(main content summary tag_list serve_by_slug_only)

    class_attribute :permitted_attributes
    self.permitted_attributes = self::PERMITTED_ATTRIBUTES <<
      { pictures_attributes: Caffeine::Picture::PERMITTED_ATTRIBUTES }

    include Caffeine::Concerns::SeoFriendly

    store_accessor :data, :main, :content, :summary, :serve_by_slug_only

    has_many :pictures, -> { order(:position) }, as: :imageable
    accepts_nested_attributes_for :pictures, allow_destroy: true

    # enum status: %i(draft published blocked)

    validates :title, presence: true

    # triggered unless page is not itself and is not selected as the main page
    before_save :drop_other_main, on: %i(create update destroy), if: ->(page) { page.main? }

    scope :main_pages, -> { where(%[data -> 'main'= 'true']) }

    acts_as_ordered_taggable

    def main?
      main
    end

    def serve_by_slug_only?
      ActiveRecord::Type::Boolean.new.type_cast_from_database(serve_by_slug_only)
    end

    private

    def drop_other_main
      self.class.main_pages.where.not(id: self.id).map do |page|
        page.main = false
        page.save
      end
    end
  end
end
