class Room < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  has_many :collaborators
  has_many :applications

  validates_presence_of :address, :price
  validates_numericality_of :price

  accepts_nested_attributes_for :photos

  before_create :assign_token

  def contacts
    [self.user, self.collaborators.map(&:user)].flatten
  end

  def assign_token
    self.token = SecureRandom.base64(6).tr("+/=lIO0", "pqrsxyz")
  end
end
