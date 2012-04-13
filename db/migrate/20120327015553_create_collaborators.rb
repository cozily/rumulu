class CreateCollaborators < ActiveRecord::Migration
  def up
    create_table :collaborators do |t|
      t.integer :room_id
      t.integer :user_id
    end
  end

  def down
    drop_table :collaborators
  end
end
