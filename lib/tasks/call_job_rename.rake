namespace :call_job_rename do
  desc "TODO"
  task update_pet_name: [:environment] do
    id = ENV["id"]
    RenamePetsJob.perform_now(id)
  end
end


#To use this rake task, send this command on the command line: rake pets_name:update_pet_name id=number
#change number to the user_id you want
