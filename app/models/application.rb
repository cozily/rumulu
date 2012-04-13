class Application < ActiveRecord::Base
  belongs_to :room
  belongs_to :user
  has_many :votes
  has_many :messages

  validates_presence_of :answer_1, :answer_2, :answer_3
  validates_presence_of :age
  validates_inclusion_of :gender, in: ["Male", "Female"]

  validates_numericality_of :age
end
