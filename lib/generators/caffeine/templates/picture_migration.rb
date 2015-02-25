class CreateCaffeinePictures < ActiveRecord::Migration
  def change
    create_table :caffeine_pictures do |t|
      t.string :image_id
      t.references :imageable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
