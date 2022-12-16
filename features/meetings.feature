Feature: Tutors should be able to submit time availability
  Users should be able see tutor's time available, and should see a list of available meeting
  
  Background: Meetings have been added to database and signed in

  Given the following meetings exist:
  | title                | description   | start_time                | end_time   | tutor_id  
  | meeting 1            | xxx           | 2022/11/16                | 2022/11/16 | 1 
  
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


  Scenario: Tutor should be able to input availability
    When I click on my own Tutor Profile
    Then I should see Add my availability
    Then I should be able to click Add my availability
    Then I should able to fill in Title
    And I should be able to fill in Description
    And I should be able to fill in Start Time
    And I should be able to fill in End Time
    And I should be able to fill in Meeting location
    And I should be able to fill in Meeting online link
    Then I should be able to click Create Meeting button
    Then I should see Meeting was successfully created
    Then I should see available meeting information

  
  Scenario: Tutor should be able to edit availability
    When I click the meeting button
    Then I should be able to click Edit this meeting
    Then I should able to edit in Title
    Then I should be able to click Update Meeting
    Then I should be able to see updated meeting


   Scenario: Tutor should be able to delete availability
    When I click the meeting button
    Then I should be able to click Delete this meeting
    And I should see Meeting was successfully destroyed

