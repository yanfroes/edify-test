namespace :pets_name do
  desc "TODO"
  task update_pet_name: [:environment] do
    pets = Pet.all
    id = ENV["id"]
    pets.each do |pet|
     if pet.user_id.to_s == id
       pet.update(name: "Sirius")
     else
     end
    end
  end
end


#To use this rake task, send this command on the command line: rake pets_name:update_pet_name id=number
#change number to the user_id you want
