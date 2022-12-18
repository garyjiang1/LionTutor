require 'rails_helper'

RSpec.feature "Meetings", type: :feature do
  context 'create new meeting' do
    scenario 'should be successful' do
      visit new_user_registration_path
      within('form') do
        fill_in "Email", with: 'test@columbia.edu'
        fill_in "Password", with: 'test'
        fill_in "Confirm Password", with: 'test'
      end
      click_button 'Sign up'
      visit new_tutor_path
      # within('form') do
      #   fill_in "First Name", with: 'test'
      #   fill_in 'Last Name', with: 'test'
      #   fill_in 'Email (email should same as your logged in email)', with: 'test@gmail.com'
      #   fill_in 'Phone Number', with: '111-111-1111'
      #   fill_in 'Tell us about yourself', with: 'test'
      # end
      tutor = Tutor.create(first_name:'first', last_name:'last', email:'test@gmail.com', phone:'1234', bio:'bio')
      tutor.user_id = 1
      tutor.save

      meeting = Meeting.new(title:'x', description:'w', start_time:'2022/11/16', end_time:'2022/11/17', meeting_location: 'Test', meeting_online_link: 'www.google.com', tutor_id: '1')
      meeting.save
      create "/tutor/#{tutor.id}/meeting/#{meeting.id}"
      # visit tutor_meeting_path(tutor, meeting)
      expect(response).to redirect_to tutor_path
      # click_button 'Add availability'

      # click_button 'Create Tutor'
      # visit new_tutor_meeting_path
      # within('form') do
      #   fill_in "Title", with: 'x'
      #   fill_in "Description", with: 'x'
      #   fill_in "Start Time", with: "2022/11/16"
      #   fill_in "End Time", with: "2022/11/16"
      #   fill_in "Meeting location", with: "Low Library"
      #   fill_in "Meeting online link", with: "www.google.com"
      # end
      # click_button 'Create Meeting'
      # expect(page).to have_content('Meeting was successfully created.')
    end

    # scenario 'should fail' do
    #   visit new_meeting_path
    #   within('form') do
    #     fill_in "Title", with: 'x'
    #     fill_in "Description", with: 'x'
    #   end
    #   click_button 'Create Meeting'
    #   expect(page).not_to have_content('Meeting was successfully created.')
    # end

  end

  context 'updates new meeting' do
    scenario 'should be successful' do
      visit new_meeting_path
      within('form') do
        fill_in "Title", with: 'x'
        fill_in "Description", with: 'x'
        fill_in "Start Time", with: "2022/11/16"
        fill_in "End Time", with: "2022/11/16"
      end
      click_button 'Create Meeting'
      meeting = Meeting.create(title:'y', description:'y', start_time:'2022/11/17', end_time:'2022/11/17')
      visit edit_meeting_path(meeting)
      within('form') do
        fill_in "Description", with: 'x'
        fill_in "Start Time", with: "2022/11/16"
      end
      click_button 'Update Meeting'
      expect(page).to have_content('Meeting was successfully updated.')
    end


    scenario 'should fail' do
      visit new_meeting_path
      within('form') do
        fill_in "Title", with: 'x'
        fill_in "Description", with: 'x'
        fill_in "Start Time", with: "2022/11/16"
        fill_in "End Time", with: "2022/11/16"
      end
      click_button 'Create Meeting'
      meeting = Meeting.create(title:'y', description:'y', start_time:'2022/11/17', end_time:'2022/11/17')
      visit edit_meeting_path(meeting)
      within('form') do
        fill_in "Description", with: ''
        fill_in "Start Time", with: ""
      end
      click_button 'Update Meeting'
      expect(page).not_to have_content('Meeting was successfully updated.')
    end
  end

  context 'deletes new meeting' do
    scenario 'should be successful' do
      visit new_meeting_path
      within('form') do
        fill_in "Title", with: 'x'
        fill_in "Description", with: 'x'
        fill_in "Start Time", with: "2022/11/16"
        fill_in "End Time", with: "2022/11/16"
      end
      click_button 'Create Meeting'
      click_on 'Delete this meeting'
      expect(page).to have_content('Meeting was successfully destroyed.')
    end
    end
end

