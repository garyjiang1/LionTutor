Feature: User sign up and sign in
    Users should be able to sign in and sign up

Scenario: Sign up and Sign in tabs should be visible
    When I go to the landing page
    Then I should see the Sign Up tab
    And I should see a Sign In tab

Scenario: User should be able to sign up
    When I click the sign up tab
    Then I should able to fill in Email
    And I should be able to fill in Password
    And I should be able to fill in Confirm Password
    Then I should be able to click Sign up button
    Then I should land on the homepage
    And I should see the Welcome To Lion Tutor text
    And I should see the Edit Profile header
    And I should see the Sign Out header

Scenario: User should be able to Sign Out
    When I click the sign out tab
    Then I should land on the homepage
    And I should see the Welcome To Lion Tutor text


Scenario: User should be able to sign in
    When I click the sign up tab
    Then I should able to fill in Email
    And I should be able to fill in Password
    And I should be able to fill in Confirm Password
    Then I should be able to click Sign up button
    Then I should land on the homepage
    And I should see the Welcome To Lion Tutor text
    And I should see the Edit Profile header
    And I should see the Sign Out header
    When I click the sign out tab
    Then I should land on the homepage
    And I should see the Welcome To Lion Tutor text
    When I click the sign in tab
    Then I should able to fill in Email
    And I should be able to fill in Password
    Then I should be able to click Log in button
    Then I should land on the homepage
    And I should see the Welcome To Lion Tutor text
    And I should see the Edit Profile header

Scenario: User should not be able to sign up
    When I click the sign up tab
    Then I should able to fill in Email
    And I should be able to fill in Password
    And I should be able to fill in wrong Confirm Password
    Then I should be able to click Sign up button
    Then I should still see Sign up