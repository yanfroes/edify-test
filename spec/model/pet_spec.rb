require 'rails_helper'

RSpec.describe Pet, type: :model do
   subject { Pet.new(name: "Vegeta", user_id: 2)}
   before { subject.save }

   it 'name should be present' do
     subject.name = nil
     expect(subject).to_not be_valid
   end

   it 'user_id should be present' do
     subject.user_id = nil
     expect(subject).to_not be_valid
   end
end
