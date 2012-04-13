class AddTokenToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :token, :string
  end
end
