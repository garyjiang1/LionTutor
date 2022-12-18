Given /the following meetings exist/ do |meetings_table|
  meetings_table.hashes.each do |meeting|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Meeting.create(meeting)
  end
end


And('I am on the Tutor Profile tab page') do 
#  visit new_meeting_path
end

Then /(.*) seed meetings should exist/ do | n_seeds |
  # expect(Meeting.count).to eq n_seeds.to_i
end

When('I go to the home page') do
  # visit root_path
end

Then('I should see the Edit Profile tab') do
  # expect(page).to have_content("Edit Profile")
end


When('I click the meeting button') do
  tutor = Tutor.create(first_name:'first', last_name:'last', email:'test@gmail.com', phone:'1234', bio:'bio')
  meeting = Meeting.create(title:'title', description:'desc', start_time:'16/12/2022', end_time:'16/12/2022', tutor_id: tutor.id, meeting_location:'uris', meeting_online_link: 'zoom')
  visit tutor_meeting_path(tutor, meeting)
end

And('I click on my own Tutor Profile') do
  tutor = Tutor.create(first_name:'first', last_name:'last', email:'test@gmail.com', phone:'1234', bio:'bio')
  visit tutor_url(tutor)
  # visit new_tutor_meeting_path(tutor)
end

Then('I should be able to click Add my availability') do
  tutor = Tutor.create(first_name:'first', last_name:'last', email:'test@gmail.com', phone:'1234', bio:'bio')
  visit new_tutor_meeting_path(tutor)
end

And("I should able to fill in Title") do
  fill_in('Title', with: 'xxx')
end

And("I should be able to fill in Description") do
  fill_in('Description', with: 'xxx')
end

And("I should be able to fill in Start Time") do
  fill_in "Start Time", with: "14/12/2022"
end

And("I should be able to fill in End Time") do
  fill_in "End Time", with: "14/12/2022"
end

And("I should be able to fill in Meeting location") do
  fill_in "Meeting location", with: "Uris hall"
end

And("I should be able to fill in Meeting online link") do
  fill_in "Meeting online link", with: "zoom"
end

Then('I should see Add my availability') do
  expect(page).to have_content("Add my availability")
end

Then("I should be able to click Create Meeting button") do
  click_button "Create Meeting"
end


Then("I should be able to click Delete this meeting") do
  click_button "Delete this meeting"
end

Then("I should be able to click Back to profile") do
  # expect(page).to have_content("Back to tutor profile")
  # visit new_tutor_meeting_path
end


Then("I should see Meeting was successfully created") do
  expect(page).to have_content("Meeting was successfully created")
end

Then("I should see available meeting information") do
  expect(page).to have_content("xxx") 
end

Then("I should see all available meeting information") do
  # expect(page).to have_content("xxx")
end

Then("I should not see all available meeting information") do
  # expect(page).to_not have_content("xxx")
end

Then("I should be able to click Edit this meeting") do
  click_link_or_button("Edit this meeting")
end

And("I should able to edit in Title") do
  fill_in('Title', with: 'meeting 2')
end

Then("I should be able to click Update Meeting") do
  click_link_or_button("Update Meeting")
end

Then("I should be able to see updated meeting") do
  expect(page).to have_content("meeting 2") 
end


Then("I should see Meeting was successfully destroyed") do
  expect(page).to have_content("Meeting was successfully destroyed") 
end