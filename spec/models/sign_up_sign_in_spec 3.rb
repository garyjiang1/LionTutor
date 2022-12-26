require 'rails_helper'
# here we are testing to model to ensure a tutor is filling out all the required fields 

RSpec.describe User, type: :model do
  context 'validation tests' do

    it 'ensures email is present' do
      user = User.new(encrypted_password: '1234567',).save
      expect(user).to eq(false)
    end

    it 'ensures an blank email will not work' do
      user = User.new(email:'').save
      expect(user).to eq(false)
    end

    it 'ensures an a weird email format will not work' do
      user = User.new(email:'xcasdasv').save
      expect(user).to eq(false)
    end

    it 'ensures a blank password will not work' do
        user = User.new(email:'test@test.com', encrypted_password:'').save
        expect(user).to eq(false)
      end
end
end
