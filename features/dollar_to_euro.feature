Feature: Convert dollars to euros

  Scenario: Basic UI
    When I get help for "dollar_to_euro"
    Then the exit status should be 0
    And the banner should be present
    And there should be a one line summary of what the app does
    And the banner should include the version
    And the banner should document that this app takes options
    And the banner should document that this app's arguments are:
      | amount | which is required |
    And the following options should be documented:
      |--version    |
      |--date       |
