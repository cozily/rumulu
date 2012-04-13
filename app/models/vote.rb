class Vote < ActiveRecord::Base
  belongs_to :application
  belongs_to :user

  validates_inclusion_of :accepted, in: [true, false]
end
