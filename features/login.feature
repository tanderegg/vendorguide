Feature: Login
  In order to add a vendor or review
  A user
  wants to login to the site

  Scenario: New user click on "Sign in with Facebook"
    Given I am on the home page
    When I follow "Sign in with Facebook"
    Then I should see "Successfully logged-in via Facebook"
