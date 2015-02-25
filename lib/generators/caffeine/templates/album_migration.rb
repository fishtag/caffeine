class CaffeineCreateAlbums < ActiveRecord::Migration
  def change
    create_table :caffeine_albums do |t|
      t.string :title
      t.string :slug
      t.boolean :fix_slug
      t.text :description
      t.text :summary
      t.belongs_to :page, index: true
    end

    add_foreign_key :caffeine_albums, :pages
    add_index       :caffeine_albums, :slug
  end
end
