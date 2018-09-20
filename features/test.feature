Feature: Test
  First test

  Scenario: Test
    Given Open the "https://udemy-react-burger-builder.firebaseapp.com" URL
    When I click on the HTML element with the ID "salad"
    When I click on the HTML element with the ID "login-to-order"
    Then I should be on "https://udemy-react-burger-builder.firebaseapp.com/auth"