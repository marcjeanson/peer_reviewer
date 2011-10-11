Feature: User Management
  In order to support multiple people accessing the application
  As an admin
  I need to be able to create and manage users

  Background:
    Given a logged in admin user

  Scenario: Viewing the user list
    Given the following users:
      | username   | first_name | last_name |
      | dvader     | Darth      | Vader     |
      | hsolo      | Han        | Solo      |
      | lskywalker | Luke       | Skywalker |
    When I visit the user admin page
    Then I should see all the users

  Scenario: Navigating to the new user page
    Given I visit the user admin page
    When I click on "New User"
    Then I should be on the new user page
