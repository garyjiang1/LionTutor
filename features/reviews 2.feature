Feature: Users should be able to review any tutor, 
each review should have corresponding linked user and tutor

Background: Add tutors and sign up
  Given the following tutors exist:
  | first_name           | last_name  | email                | phone         | bio                  | user_id
  | MD Monirul           | Islam      | im2594@columbia.edu  | 111-222-3456  | Hi! I like to teach! | 1
  | Faiza                | Khan       | fk2421@columbia.edu  | 111-222-3456  | Hi! I like to teach! | 2
  | Gary                 | Jiang      | chillg@columbia.edu  | 111-222-3456  | Hi! I'm chilling!    | 3

    When I click the sign up tab
    Then I should able to fill in Email
    And I should be able to fill in Password
    And I should be able to fill in Confirm Password
    Then I should be able to click Sign up button
    Then I should land on the homepage
    And I should see the Welcome To Lion Tutor text

  Scenario: Users should be able to review any tutor
    When I am on the home page
    Then I should see the Tutors tab
    When I click on the Tutors tab
    Then I should see a tutor with name Faiza
    When I click the tutor with name Faiza
    Then I should see a Write a Review button
    When I click Write a Review button
    And I fill out the review rating
    And I fill out the review comment
    Then I should see review created message
    And I should see average rating
  
    Scenario: Users review should fail with bad input
      When I am on the home page
      Then I should see the Tutors tab
      When I click on the Tutors tab
      Then I should see a tutor with name Faiza
      When I click the tutor with name Faiza
      Then I should see a Write a Review button
      When I click Write a Review button
      And I fill out the wrong review rating
      Then I should not see review created message
      And I should not see average rating
