class CreateRooms < ActiveRecord::Migration
  def up
    create_table :rooms do |t|
      t.belongs_to :user
      t.string :address
      t.integer :price
      t.boolean :utilities_included, :default => false
      t.text :description
    end
  end

  def down
    drop_table :rooms
  end
end
