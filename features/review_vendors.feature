Feature: Review vendors
  In order to have reviews
  A logged in user
  wants to rate various vendors

  Scenario: Review a vendor
    Given a vendor exists
    And I am logged into the site
    And I am on the vendor page
    When I fill in "Description" with "describing the vendor"
    And  I select "5" from "Score"
    And  I press "Create Review"
    Then I should see "describing the vendor"

