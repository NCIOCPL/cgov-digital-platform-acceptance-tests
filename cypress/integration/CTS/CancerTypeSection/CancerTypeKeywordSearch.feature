Feature: Primary CancerType keyword search

  Scenario: User is able to search for cancer type via autosuggest
    Given user is navigating to "/about-cancer/treatment/clinical-trials/search/advanced"
    When user clicks on "all" field
    Then cancer types dropdown is displayed
    And autosuggest component is displayed
    And placeholder text "Start typing to narrow options below" displayed

  Scenario: User is able to execute search for cancer type via autosuggest
    Given user is navigating to "/about-cancer/treatment/clinical-trials/search/advanced"
    When user clicks on "all" field
    And user types "Breast Cancer" in the autosuggest field
    When user selects matched cancer type from autosuggest
    And user clicks "Find Trials" button
    Then the search is executed and results page is displayed
    And the url query has the following
      | parameter | value |
      | t         | C4872 |
      | loc       | 0     |
      | rl        | 2     |

  Scenario: After selecting cancer type, Subtype, Stage, Side Effects fields appear
    Given user is navigating to "/about-cancer/treatment/clinical-trials/search/advanced"
    When user clicks on "all" field
    And user types "Breast Cancer" in the autosuggest field
    When user selects matched cancer type from autosuggest
    Then field with placeholder appears
      | field                                          | placeholder                      |
      | Subtype                                        | Start typing to select a subtype |
      | Stage                                          | Start typing to select a stage   |
      | Side Effects/Biomarkers/Participant Attributes | Examples: Nausea, BRCA1          |

