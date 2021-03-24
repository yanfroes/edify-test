class User < ApplicationRecord
  after_save :create_two_pets


  has_secure_password
  has_many :pets

  def create_two_pets
    Pet.create(user_id: self.id, name: "Sukita")
    Pet.create(user_id: self.id, name: "Goku")
  end
end
