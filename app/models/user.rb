class User < ApplicationRecord
  after_save :create_two_pets
  validates :name, presence: true
  validates :email, presence: true
  has_secure_password
  has_many :pets, dependent: :destroy
  accepts_nested_attributes_for :pets

  def create_two_pets
    Pet.create(user_id: self.id, name: "Sukita")
    Pet.create(user_id: self.id, name: "Goku")
  end
end
