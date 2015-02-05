class CaffeineCreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.string :slug
      t.boolean :fix_slug
      t.text :description
      t.text :summary
      t.belongs_to :page, index: true
    end

    add_foreign_key :albums, :pages
    add_index       :albums, :slug
  end
end
