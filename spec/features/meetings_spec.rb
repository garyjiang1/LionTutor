require 'rails_helper'

RSpec.feature "Meetings", type: :feature do
  context 'create new meeting' do
    scenario 'should be successful' do
      visit new_user_registration_path
      within('form') do
        fill_in "Email", with: 'test@columbia.edu'
        fill_in "Password", with: 'test12'
        fill_in "Confirm Password", with: 'test12'
      end
      click_button 'Sign up'
      expect(page).to have_content('Welcome To Lion Tutor')

      tutor = Tutor.create(first_name:'first', last_name:'last', email:'test@gmail.com', phone:'1234', bio:'bio')
      visit tutor_url(tutor)
      visit new_tutor_meeting_path(tutor)
      within('form') do
          fill_in "Title", with: 'x'
          fill_in "Description", with: 'x'
          fill_in "Start Time", with: "2022/11/16"
          fill_in "End Time", with: "2022/11/16"
          fill_in "Meeting location", with: "Low Library"
          fill_in "Meeting online link", with: "www.google.com"
        end
        click_button 'Create Meeting'
        expect(page).to have_content('Meeting was successfully created.')
    end

    scenario 'should not be successful' do
      visit new_user_registration_path
      within('form') do
        fill_in "Email", with: 'test@columbia.edu'
        fill_in "Password", with: 'test12'
        fill_in "Confirm Password", with: 'test12'
      end
      click_button 'Sign up'
      expect(page).to have_content('Welcome To Lion Tutor')

      tutor = Tutor.create(first_name:'first', last_name:'last', email:'test@gmail.com', phone:'1234', bio:'bio')
      visit tutor_url(tutor)
      visit new_tutor_meeting_path(tutor)
      within('form') do
        fill_in "Title", with: ''
        fill_in "Description", with: ''
        fill_in "Start Time", with: ''
        fill_in "End Time", with: ''
        fill_in "Meeting location", with: ''
        fill_in "Meeting online link", with: 'www.google.com'
      end
      click_button 'Create Meeting'
      expect(page).to_not have_content('Meeting was successfully created.')
    end
  end

  context 'updates new meeting' do
    scenario 'should be successful' do
      visit new_user_registration_path
        within('form') do
          fill_in "Email", with: 'test@columbia.edu'
          fill_in "Password", with: 'test12'
          fill_in "Confirm Password", with: 'test12'
        end
        click_button 'Sign up'
        expect(page).to have_content('Welcome To Lion Tutor')
      
      tutor = Tutor.create(first_name:'first', last_name:'last', email:'test@columbia.edu', phone:'1234', bio:'bio')
      meeting = Meeting.create(title:'title', description:'desc', start_time:'16/12/2022', end_time:'16/12/2022', tutor_id: tutor.id, meeting_location:'uris', meeting_online_link: 'zoom')
      visit tutor_meeting_path(tutor, meeting)
      click_link_or_button("Edit this meeting")
      within('form') do
        fill_in "Description", with: 'x'
        fill_in "Start Time", with: "2022/11/16"
      end
      click_link_or_button 'Update Meeting'
      expect(page).to have_content('Meeting was successfully updated.')
    end


    scenario 'should fail' do
      visit new_user_registration_path
        within('form') do
          fill_in "Email", with: 'test@columbia.edu'
          fill_in "Password", with: 'test12'
          fill_in "Confirm Password", with: 'test12'
        end
        click_button 'Sign up'
        expect(page).to have_content('Welcome To Lion Tutor')
      
      tutor = Tutor.create(first_name:'first', last_name:'last', email:'test@columbia.edu', phone:'1234', bio:'bio')
      meeting = Meeting.create(title:'title', description:'desc', start_time:'16/12/2022', end_time:'16/12/2022', tutor_id: tutor.id, meeting_location:'uris', meeting_online_link: 'zoom')
      visit tutor_meeting_path(tutor, meeting)
      click_link_or_button("Edit this meeting")
      within('form') do
        fill_in "Description", with: ''
        fill_in "Start Time", with: ""
      end
      click_link_or_button 'Update Meeting'
      expect(page).to_not have_content('Meeting was successfully updated.')
    end
  end

  context 'deletes new meeting' do
    scenario 'should be successful' do
      visit new_user_registration_path
        within('form') do
          fill_in "Email", with: 'test@columbia.edu'
          fill_in "Password", with: 'test12'
          fill_in "Confirm Password", with: 'test12'
        end
        click_button 'Sign up'
        expect(page).to have_content('Welcome To Lion Tutor')
      
      tutor = Tutor.create(first_name:'first', last_name:'last', email:'test@columbia.edu', phone:'1234', bio:'bio')
      meeting = Meeting.create(title:'title', description:'desc', start_time:'16/12/2022', end_time:'16/12/2022', tutor_id: tutor.id, meeting_location:'uris', meeting_online_link: 'zoom')
      visit tutor_meeting_path(tutor, meeting)
      click_link_or_button('Delete this meeting')
      expect(page).to have_content('Meeting was successfully destroyed.')
    end
    end
end

