When('I go to the landing page') do
    visit root_path
end

Then('I should see the Sign Up tab') do
    expect(page).to have_content("Sign Up")
end

Then('I should see a Sign In tab') do
    expect(page).to have_content("Sign In")
end

When('I click the sign up tab') do
   visit new_user_registration_path
end

And("I should able to fill in Email") do
    # expect(page).to have_content('Email')
    fill_in('Email', with: 'test@gmail.com')
end

And("I should be able to fill in Password") do
    fill_in('Password', with: 'mypassword')
end

And("I should be able to fill in Confirm Password") do
    fill_in('Confirm Password', with: 'mypassword')
end

And("I should be able to fill in wrong Confirm Password") do
    fill_in('Confirm Password', with: 'mypass')
end

Then("I should be able to click Sign up button") do
    click_button "Sign up"
end

Then("I should land on the homepage") do
    visit root_path
end


Then("I should see the Welcome To Lion Tutor text") do
    expect(page).to have_content("Welcome To Lion Tutor") 
end

#Then("I should see the Tutor Profile header") do
#    expect(page).to have_content("Tutor Profile") 
#end

Then("I should see the Edit Profile header") do
    expect(page).to have_content("Edit Profile") 
end

Then("I should still see Sign up") do
    expect(page).to have_content("Sign up") 
end


Then("I should see the Sign Out header") do
    expect(page).to have_content("Sign Out") 
end

When('I click the sign in tab') do
    visit new_user_session_path
 end

 When('I click the sign out tab') do
    visit destroy_user_session_path
 end

 Then("I should be able to click Log in button") do
    click_button "Log in"
end

