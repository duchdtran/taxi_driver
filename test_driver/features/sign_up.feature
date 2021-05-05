Feature: Sign Up Screen

  Background: Open Sign Up Screen
    When I tap the label that contains the text "Or Create My Account"
    Then I expect the widget "sign up screen" to be present within 15 seconds

  Scenario: Sign Up
    When I fill the "phone number" field with "0123456789"
    When I tap the button that contains the text "Continue"

#   Scenario: Terms of Service
#     When I tap the label that contains the text "Terms of Service"
  
#   Scenario: Privacy policy
#     When I tap the label that contains the text "Privacy policy"