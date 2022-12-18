require 'rails_helper'

RSpec.describe "Tutors", type: :request do
  before(:all) do
    @tutor = Tutor.create(first_name:'Faiza', last_name:'Khan', email:'fk2421@columbia.edu', phone:'1234', bio:'CS')
  end

  describe "Test for tutors page" do
    it "returns a success for tutor page" do
      get tutors_path
      expect(response).to be_successful
    end

    it "returns a success and displays a newly created tutor" do
      tutor = Tutor.new(first_name:'md monirul', last_name:'islam', email:'test@gmail.com', phone:'1234', bio:'bio').save
      get tutors_path
      expect(response).to be_successful
      expect(response.body).to include("md monirul")
      expect(response.body).not_to include("gary")
    end
  end

  describe "Test for tutors page delete" do
    it "deletes a tutor" do
      @tutor.destroy
      expect { @tutor.reload }.to raise_error ActiveRecord::RecordNotFound
    end
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      tutor = Tutor.new(first_name:'md monirul', last_name:'islam', email:'test@gmail.com', phone:'1234', bio:'bio', user_id: 1).save
      # post.user = current_user
      # post.save
      get tutors_path
      expect(response).to be_successful
    end
  end


  describe 'GET /show' do
    tutor = FactoryBot.create(:tutor)
    # tutor = Tutor.new(first_name:'md monirul', last_name:'islam', email:'test@gmail.com', phone:'1234', bio:'bio')
    it 'shows the tutor' do
      expect(tutor).not_to be nil
    end
  end

end
