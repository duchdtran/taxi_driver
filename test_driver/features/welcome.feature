Feature: Welcome Screen

  Scenario: Open Login Screen
    When I tap the button that contains the text "Login with Phone"
    Then I expect the widget "sign in screen" to be present within 15 seconds

  Scenario: Open Sign Up Screen
    When I tap the label that contains the text "Or Create My Account"
    Then I expect the widget "sign up screen" to be present within 15 seconds
