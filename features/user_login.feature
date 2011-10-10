Feature: User Login
  As a user
  I need to be able to login to the application
  So that I can gain access to the application

  Scenario: User is greeted upon login
    Given the user "Marc" has an account
    When he logs in
    Then he should see "Welcome, Marc"
