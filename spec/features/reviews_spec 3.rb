require 'rails_helper'

RSpec.feature "Reviews", type: :feature do
  context 'create new review' do
    scenario 'should be successful' do
        visit new_user_registration_path
        within('form') do
          fill_in "Email", with: 'fk2421@columbia.edu'
          fill_in "Password", with: 'pwd123'
          fill_in "Confirm Password", with: 'pwd123'
        end
        click_button 'Sign up'
        visit new_tutor_path
        within('form') do
          fill_in 'First Name', with: 'John'
          fill_in 'Last Name', with: 'Smith'
          fill_in 'Email (email should same as your logged in email)', with: 'smith@gmail.com'
          fill_in 'Phone Number', with: '123-456-7890'
          fill_in 'Tell us about yourself', with: 'enthusiastic student tutor'
        end
        click_button 'Create Tutor'
        click_link_or_button "Write a Review"
        within('form') do
            fill_in "Rating", with: '4'
            fill_in "Comment", with: 'good tutor'
        end
        click_button 'Create Review'
        expect(page).to have_content('Review was successfully created.')
    end
    scenario 'should fail if review rating is null' do
        visit new_user_registration_path
        within('form') do
          fill_in "Email", with: 'fk2421@columbia.edu'
          fill_in "Password", with: 'pwd123'
          fill_in "Confirm Password", with: 'pwd123'
        end
        click_button 'Sign up'
        visit new_tutor_path
        within('form') do
          fill_in 'First Name', with: 'John'
          fill_in 'Last Name', with: 'Smith'
          fill_in 'Email (email should same as your logged in email)', with: 'smith@gmail.com'
          fill_in 'Phone Number', with: '123-456-7890'
          fill_in 'Tell us about yourself', with: 'enthusiastic student tutor'
        end
        click_button 'Create Tutor'
        click_link_or_button "Write a Review"
        within('form') do
            fill_in "Rating", with: ''
            fill_in "Comment", with: 'good tutor'
        end
        click_button 'Create Review'
        expect(page).to have_content('error prohibited this review from being saved')
      end
  end
end

