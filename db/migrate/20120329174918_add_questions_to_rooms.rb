class AddQuestionsToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :question_1, :string
    add_column :rooms, :question_2, :string
    add_column :rooms, :question_3, :string
  end
end
