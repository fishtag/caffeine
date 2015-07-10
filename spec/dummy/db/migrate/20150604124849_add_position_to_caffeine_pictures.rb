class AddPositionToCaffeinePictures < ActiveRecord::Migration
  def change
    add_column :caffeine_pictures, :position, :integer
  end
end
