class CreateApplications < ActiveRecord::Migration
  def up
    create_table :applications do |t|
      t.belongs_to :user
      t.belongs_to :room
      t.string :answer_1
      t.string :answer_2
      t.string :answer_3
      t.integer :age
      t.string :gender
      t.boolean :has_pets
      t.boolean :is_student
      t.text :comments
      t.timestamps
    end
  end

  def down
    drop_table :applications
  end
end
