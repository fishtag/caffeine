module Caffeine
  class Page < ActiveRecord::Base
    include Concerns::Sluggable

    has_many :pictures, as: :imageable
    # has_one :seo_datum, as: :datable, dependent: :destroy

    # delegate :meta_title, :meta_keywords, :meta_description, :seo_text, to: :seo_datum
    # accepts_nested_attributes_for :seo_datum, update_only: true

    enum status: %i(draft published blocked)

    validates :title, presence: true
    validates :main, uniqueness: true, if: ->(page) { page.main? }

    # triggered unless page is not itself and is not selected as the main page
    before_save :drop_other_main, on: %i(create update destroy), if: ->(o) { o.main? }

    acts_as_taggable
    has_closure_tree order: 'position', name_column: 'slug'

    def main_page?
      self == Page.main_page
    end

    def self.main_page
      where(main: true).first
    end

    private

    def drop_other_main
      self.class.where(main: true).where.not(id: self.id).update_all(main: false)
    end
  end
end
