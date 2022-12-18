When('I am on the home page') do
    visit root_path
  end
  
Then('I should see the Tutors tab') do
    expect(page).to have_content("Tutors")
end

When('I click on the Tutors tab') do
    visit tutors_path
end

Then('I should see a tutor with name Faiza') do 
    expect(page).to have_content "Faiza"
end

When('I click the tutor with name Faiza') do 
    click_link_or_button "Faiza Khan"
end

Then('I should see a Write a Review button') do
    expect(page).to have_content "Write a Review"
end

When('I click Write a Review button') do
    click_link_or_button "Write a Review"
end

And('I fill out the review rating') do
    fill_in('Rating', with: '5')
end

And('I fill out the review comment') do
    fill_in('Comment', with: 'Faiza is an awesome tutor')
    click_on('Create Review')
end

Then('I should see review created message') do
   expect(page).to have_content("Review was successfully created.")
end

And('I should see average rating') do
    expect(page).to have_content("Average Rating (1-poor, 5-excellent):")
end

And('I fill out the wrong review rating') do
    fill_in('Rating', with: '7')
end

Then('I should not see review created message') do
    expect(page).to_not have_content("Review was successfully created.")
end

And('I should not see average rating') do
    expect(page).to_not have_content("Average Rating (1-poor, 5-excellent):")
end