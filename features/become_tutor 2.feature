Feature: become a new tutor
    As a student of the course I would like to sign up to become a tutor    
    So that I can share my knowedge of a given topic to my classmate
    I want interested classmates to be able to choose me as their tutor

Background: Should should sign up
    When I click the sign up tab
    Then I should able to fill in Email
    And I should be able to fill in Password
    And I should be able to fill in Confirm Password
    Then I should be able to click Sign up button
    Then I should land on the homepage
    And I should see the Welcome To Lion Tutor text

Scenario: Become a tutor tab should be visible
    When I go to the homepage
    Then I should see the Become a tutor tab

Scenario: Creating new tutor (happy path)
    Given I am on Become a Tutor Page
    And I fill out the tutor information
    Then I should see tutor created message
    And I should not see tutor list page

Scenario: Creating new tutor (sad path)
    Given I am on Become a Tutor Page
    And I fill out the tutor information with empty entry
    Then I should see 7 errors prohibited this tutor from being saved
    And I should see First name can not be blank
    And I should see Last name can not be blank
    And I should see Email can not be blank
    And I should see Phone can not be blank
    And I should see Bio can not be blank
    Then I should not see tutor created message
    And I should not see tutor list page