class CreatePhotos < ActiveRecord::Migration
  def up
    create_table :photos do |t|
      t.integer :room_id
      t.string :image
      t.string :caption
      t.integer :position
      t.timestamps
    end
  end

  def down
    drop_table :photos
  end
end
