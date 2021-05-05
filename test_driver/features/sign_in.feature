Feature: Welcome Screen

  Background: Open Login Screen
    When I tap the button that contains the text "Login with Phone"
    Then I expect the widget "sign in screen" to be present within 15 seconds

  Scenario: Sign In
    When I fill the "phone number" field with "0123456789"
    When I fill the "password" field with "1234"
    When I tap the button that contains the text "Login"

  Scenario: Forgot password
    When I tap the label that contains the text "Forgot password?"
  
  Scenario: Sign Up
    When I tap the label that contains the text "Or Create My Account"

  Scenario: Back to prev screen
    When I tap the back button
    Then I expect the widget "welcome screen" to be present within 15 seconds
