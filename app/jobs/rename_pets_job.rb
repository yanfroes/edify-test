class RenamePetsJob < ApplicationJob
  queue_as :default

  def perform(id)
    pets = Pet.all
    pets.each do |pet|
     if pet.user_id.to_s == id
       pet.update(name: "Sirius")
     else
     end
    end
  end
end
