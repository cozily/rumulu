class CreateVotes < ActiveRecord::Migration
  def up
    create_table :votes do |t|
      t.belongs_to :user
      t.belongs_to :application
      t.boolean :accepted, null: false
      t.timestamps
    end
  end

  def down
    drop_table :votes
  end
end
