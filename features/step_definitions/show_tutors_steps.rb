Given /the following tutors exist/ do |tutors_table|
    tutors_table.hashes.each do |tutor|
      # each returned element will be a hash whose key is the table header.
      # you should arrange to add that movie to the database here.
      Tutor.create(tutor)
    end
end


And('I am on the Tutors tab page') do 
    visit tutors_path
end

Then /(.*) seed tutors should exist/ do | n_seeds |
    expect(Tutor.count).to eq n_seeds.to_i
end

When('I click Tutors') do
    visit tutors_path
end


When('I click on my tutor profile') do
    tutor = Tutor.create(first_name:'first', last_name:'last', email:'test@gmail.com', phone:'1234', bio:'bio')
    visit tutor_url(tutor)
end

When('I press Add Another Tutor button') do
    visit new_tutor_path
end

Then('I should see the list of tutors info columns') do
    expect(page).to have_content "Tutors List"
    expect(page).to have_content "Name"
    expect(page).to have_content "Email"    
    expect(page).to have_content "Phone"
    expect(page).to have_content "Bio"
end 

And ('I should not see Tutor was successfully created message') do
    expect(page).should_not have_content "Tutor was successfully created"
end

Then /I should see all the tutors/ do
    # Make sure that all the movies in the app are visible in the table
    expect(page).to have_xpath("//tr", count: 4)
end

Then('I should see new tutor page with an option to create tutor') do
    expect(page).to have_button 'Create Tutor'
end

Then('I should see Delete me from tutor button') do
    expect(page).to have_button 'Delete me from tutor'
end

When("I click Delete me from tutor button") do
    click_button "Delete me from tutor"
  end

Then('I should see Edit my profile button') do
    expect(page).to have_content 'Edit my profile'
end

When("I click on Edit my profile button") do
    click_link_or_button "Edit my profile"
  end

Then('I should see Editing tutor') do
    expect(page).to have_content 'Editing tutor'
end

Then('I should see Tutor was successfully destroyed') do
    expect(page).to have_content 'Tutor was successfully destroyed'
end

And("I should able to edit Last Name") do
    fill_in('Last Name', with: 'New last name')
end

When("I should be able to click Update Tutor") do
    click_button "Update Tutor"
  end

  Then('I should see updated last name') do
    expect(page).to have_content 'New last name'
end