Feature: Test scenarios for demo porposes
  First test

  Scenario: The "Login to Order" button is disabled on open
    Given I open the "http://localhost:3000" URL
    Then The HTML element with "login-to-order" is disabled

  Scenario Outline: The "Login to Order" button is enabled after choosing at least on ingredient
    Given I open the "http://localhost:3000" URL
    When I click on the HTML element with the ID <buttonId>
    Then The HTML element with "login-to-order" is enabled

    Examples:
      | buttonId     |
      | "salad-more" |
      | "bacon-more" |

  Scenario: The "Sign up" button is disabled on empty form
    Given I open the "http://localhost:3000" URL
    When I click on the HTML element with the ID "salad-more"
      And I click on the HTML element with the ID "login-to-order"
    Then The HTML element with "signin" is disabled


  Scenario: It navigates to the checkout form on login after a burger building
    Given I open the "http://localhost:3000" URL
    When I click on the HTML element with the ID "salad-more"
      And I click on the HTML element with the ID "login-to-order"
      And I fill in the following:
      | id=signin-input-email    | test@infullmobile.com |
      | id=signin-input-password | password              |
      And I click on the HTML element with the ID "auth-switch-to"
      And I click on the HTML element with the ID "signin"
      And I wait 2 seconds
    Then I should be on "http://localhost:3000/checkout"


  Scenario: The order summary modal shows on clicking on the Order button
    # Aka the user is logged in
    Given I open the "http://localhost:3000" URL
      And The "logout-id" element is visible
    When I click on the HTML element with the ID "salad-more"
      And I click on the HTML element with the ID "login-to-order"
    Then The "ordersummery-modal" element is visible


  Scenario: The Order button is enabled after filling out the form
    # Aka the user is logged in
    Given I open the "http://localhost:3000" URL
      And The "logout-id" element is visible
    When I click on the HTML element with the ID "salad-more"
      And I click on the HTML element with the ID "login-to-order"
      And I click on the HTML element with the ID "continue-to-order"
      And I click on the HTML element with the ID "continue-to-checkin"
      And I fill in the following:
      | id=name    | Test Name             |
      | id=street  | Test Street           |
      | id=zipCode | 1111                  |
      | id=country | Hungary               |
      | id=email   | test@infullmobile.com |
    Then The HTML element with "order" is enabled
