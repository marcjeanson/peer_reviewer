Feature: Reviews
  As a manager
  I want to crud reviews
  So that they can be filled out by the employees

  Background:
    Given a logged in manager

  Scenario: Navigating to the reviews page
    Given the following reviews:
      | title           | start_on   | end_on     |
      | Quarter Review  | 2011-10-01 | 2011-10-31 |
      | Annual Review   | 2011-12-01 | 2011-12-31 |
    When I click on "Reviews"
    Then I should be on the reviews page
    And I should see all the reviews

  Scenario: Navigating to the new review page
    Given I visit the reviews page
    When I click on "New Review"
    Then I should be on the new review page
