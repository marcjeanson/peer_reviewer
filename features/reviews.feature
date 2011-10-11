Feature: Reviews
  As a manager
  I want to crud reviews
  So that they can be filled out by the employees

  Background:
    Given a logged in manager

  Scenario: Navigating to the reviews page
    When I click on "Reviews"
    Then I should be on the reviews page
    And I should see all the reviews
