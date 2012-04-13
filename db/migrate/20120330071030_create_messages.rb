class CreateMessages < ActiveRecord::Migration
  def up
    create_table :messages do |t|
      t.belongs_to :application
      t.belongs_to :user
      t.text :body
      t.timestamps
    end
  end

  def down
    drop_table :messages
  end
end
