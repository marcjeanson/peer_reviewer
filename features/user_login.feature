Feature: User Login
  As a user
  I need to be able to login to the application
  So that I can gain access to the application

  Scenario: User is greeted upon login
    Given the user "Marc" has an account
    When he logs in
    Then he should see "Welcome, Marc"

  Scenario: User tries to login with an invalid username
    Given the user "Marc" has an account
    When he tries to login with an invalid username
    Then he should be asked to try logging in again

  Scenario: User tries to login with an invalid password
    Given the user "Marc" has an account
    When he tries to login with an invalid password
    Then he should be asked to try logging in again

  Scenario: User logs out
    Given a logged in user
    When he logs out
    Then he should be redirected to the login page
