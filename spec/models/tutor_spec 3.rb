require 'rails_helper'
# here we are testing to model to ensure a tutor is filling out all the required fields 

RSpec.describe Tutor, type: :model do
  context 'validation tests' do
    it 'ensures first name is present' do
      tutor = Tutor.new(last_name:'last', email:'test@gmail.com').save
      expect(tutor).to eq(false)
    end

    it 'ensures last name is present' do
      tutor = Tutor.new(first_name:'first', email:'test@gmail.com').save
      expect(tutor).to eq(false)
    end

    it 'ensures email is present' do
      tutor = Tutor.new(first_name:'first', last_name:'last').save
      expect(tutor).to eq(false)
    end

    it 'ensures an blank email will not work' do
      tutor = Tutor.new(email:'').save
      expect(tutor).to eq(false)
    end

    it 'ensures an a weird email format will not work' do
      tutor = Tutor.new(email:'xcasdasv').save
      expect(tutor).to eq(false)
    end

    it 'ensures phone is present' do
      tutor = Tutor.new(first_name:'first', last_name:'last').save
      expect(tutor).to eq(false)
    end

    it 'ensures non-number phone can not work' do
      tutor = Tutor.new(phone:'x').save
      expect(tutor).to eq(false)
    end


    it 'ensure the phone is number' do
      tutor = Tutor.new(phone:'1112223333').save
      expect(tutor).to eq(false)
    end

    it 'ensures bio is present' do
      tutor = Tutor.new(first_name:'first', last_name:'last').save
      expect(tutor).to eq(false)
    end

    it 'should successfully save a tutor' do
      tutor = Tutor.new(first_name:'first', last_name:'last', email:'test@gmail.com', phone:'1234', bio:'bio').save
      expect(tutor).to eq(true)
    end

  end

end
