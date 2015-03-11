module Caffeine
  class Page < Node
    store_accessor :data, :main, :content, :summary

    has_many :pictures, as: :imageable
    # has_one :seo_datum, as: :datable, dependent: :destroy

    # delegate :meta_title, :meta_keywords, :meta_description, :seo_text, to: :seo_datum
    # accepts_nested_attributes_for :seo_datum, update_only: true

    # enum status: %i(draft published blocked)

    validates :title, presence: true

    # triggered unless page is not itself and is not selected as the main page
    before_save :drop_other_main, on: %i(create update destroy), if: ->(page) { page.main? }

    scope :main_pages, -> { where(%[data -> 'main'= 'true']) }

    acts_as_taggable

    def main?
      main
    end

    def main_page?
      persisted? ? main? : false
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
