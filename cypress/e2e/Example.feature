Feature: Example feature to test cypress setup

  @focus
  Scenario: The home page loads
    Given the user visits the homepage
    Then browser title is "Comprehensive Cancer Information - NCI"