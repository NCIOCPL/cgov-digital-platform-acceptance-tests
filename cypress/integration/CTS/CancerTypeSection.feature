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
    And the url query has the following corresponding code
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

  Scenario: User is able to execute search for Cancer type and subtype
    Given user is navigating to "/about-cancer/treatment/clinical-trials/search/advanced"
    When user clicks on "all" field
    And user types "Breast Cancer" in the autosuggest field
    When user selects matched cancer type from autosuggest
    Then field with placeholder appears
      | field   | placeholder                      |
      | Subtype | Start typing to select a subtype |
    When user types following value and selects matched option in the corresponding field
      | field   | value                   |
      | Subtype | Bilateral Breast Cancer |
    And user clicks "Find Trials" button
    Then the search is executed and results page is displayed
    And the url query has the following corresponding code
      | parameter | value |
      | t         | C4872 |
      | loc       | 0     |
      | rl        | 2     |
      | st        | C8287 |


  Scenario: User is able to execute search for Cancer type, subtype and stage
    Given user is navigating to "/about-cancer/treatment/clinical-trials/search/advanced"
    When user clicks on "all" field
    And user types "Breast Cancer" in the autosuggest field
    When user selects matched cancer type from autosuggest
    Then field with placeholder appears
      | field   | placeholder                      |
      | Subtype | Start typing to select a subtype |
    When user types following value and selects matched option in the corresponding field
      | field   | value                     |
      | Subtype | Bilateral Breast Cancer   |
      | Stage   | Early-Stage Breast Cancer |
    And user clicks "Find Trials" button
    Then the search is executed and results page is displayed
    And the url query has the following corresponding code
      | parameter | value  |
      | t         | C4872  |
      | loc       | 0      |
      | rl        | 2      |
      | st        | C8287  |
      | stg       | C94774 |

  Scenario: User is able to execute search for Cancer type, subtype, stage and side effects
    Given user is navigating to "/about-cancer/treatment/clinical-trials/search/advanced"
    When user clicks on "all" field
    And user types "Breast Cancer" in the autosuggest field
    When user selects matched cancer type from autosuggest
    Then field with placeholder appears
      | field   | placeholder                      |
      | Subtype | Start typing to select a subtype |
    When user types following value and selects matched option in the corresponding field
      | field        | value                     |
      | Subtype      | Bilateral Breast Cancer   |
      | Stage        | Early-Stage Breast Cancer |
      | Side Effects | Cancer Survivor           |
    And user clicks "Find Trials" button
    Then the search is executed and results page is displayed
    And the url query has the following corresponding code
      | parameter | value  |
      | t         | C4872  |
      | loc       | 0      |
      | rl        | 2      |
      | st        | C8287  |
      | stg       | C94774 |
      | fin       | C18673 |

  Scenario: User is able to execute search for Cancer type, stage and side effects
    Given user is navigating to "/about-cancer/treatment/clinical-trials/search/advanced"
    When user clicks on "all" field
    And user types "Breast Cancer" in the autosuggest field
    When user selects matched cancer type from autosuggest
    When user types following value and selects matched option in the corresponding field
      | field        | value                     |
      | Stage        | Early-Stage Breast Cancer |
      | Side Effects | Cancer Survivor           |
    And user clicks "Find Trials" button
    Then the search is executed and results page is displayed
    And the url query has the following corresponding code
      | parameter | value  |
      | t         | C4872  |
      | loc       | 0      |
      | rl        | 2      |
      | stg       | C94774 |
      | fin       | C18673 |

  Scenario: User is able to execute search for Cancer type, subtype and side effects
    Given user is navigating to "/about-cancer/treatment/clinical-trials/search/advanced"
    When user clicks on "all" field
    And user types "Breast Cancer" in the autosuggest field
    When user selects matched cancer type from autosuggest
    Then field with placeholder appears
      | field   | placeholder                      |
      | Subtype | Start typing to select a subtype |
    When user types following value and selects matched option in the corresponding field
      | field        | value                   |
      | Subtype      | Bilateral Breast Cancer |
      | Side Effects | Cancer Survivor         |
    And user clicks "Find Trials" button
    Then the search is executed and results page is displayed
    And the url query has the following corresponding code
      | parameter | value  |
      | t         | C4872  |
      | loc       | 0      |
      | rl        | 2      |
      | st        | C8287  |
      | fin       | C18673 |

  Scenario: User is able to execute search for Cancer type and side effects
    Given user is navigating to "/about-cancer/treatment/clinical-trials/search/advanced"
    When user clicks on "all" field
    And user types "Breast Cancer" in the autosuggest field
    When user selects matched cancer type from autosuggest
    Then field with placeholder appears
      | field   | placeholder                      |
      | Subtype | Start typing to select a subtype |
    When user types following value and selects matched option in the corresponding field
      | field        | value           |
      | Side Effects | Cancer Survivor |
    And user clicks "Find Trials" button
    Then the search is executed and results page is displayed
    And the url query has the following corresponding code
      | parameter | value  |
      | t         | C4872  |
      | loc       | 0      |
      | rl        | 2      |
      | fin       | C18673 |

