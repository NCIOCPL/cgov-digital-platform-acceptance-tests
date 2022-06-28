Feature: Primary CancerType keyword search

  Scenario: User is able to search for cancer type via autosuggest on desktop
    Given user is navigating to "/about-cancer/treatment/clinical-trials/search/advanced"
    When user clicks on "all" field
    Then cancer types dropdown is displayed
    And autosuggest component is displayed
    And placeholder text "Start typing to narrow options below" displayed

  Scenario: User is able to execute search for cancer type via autosuggest on tablet
    Given user is navigating to "/about-cancer/treatment/clinical-trials/search/advanced"
    And screen breakpoint is set to "tablet"
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

  Scenario: After selecting cancer type, Subtype, Stage, Side Effects fields appear on desktop
    Given user is navigating to "/about-cancer/treatment/clinical-trials/search/advanced"
    When user clicks on "all" field
    And user types "Breast Cancer" in the autosuggest field
    When user selects matched cancer type from autosuggest
    Then field with placeholder appears
      | field                                          | placeholder                      |
      | Subtype                                        | Start typing to select a subtype |
      | Stage                                          | Start typing to select a stage   |
      | Side Effects/Biomarkers/Participant Attributes | Examples: Nausea, BRCA1          |

  Scenario: User is able to execute search for Cancer type and subtype on Tablet
    Given user is navigating to "/about-cancer/treatment/clinical-trials/search/advanced"
    And screen breakpoint is set to "tablet"
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


  Scenario: User is able to execute search for Cancer type, subtype and stage on desktop
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

  Scenario: User is able to execute search for Cancer type, subtype, stage and side effects on mobile
    Given user is navigating to "/about-cancer/treatment/clinical-trials/search/advanced"
    And screen breakpoint is set to "mobile"
    When user clicks on "all" field
    And user types "Acute Myeloid Leukemia (AML)" in the autosuggest field
    When user selects matched cancer type from autosuggest
    Then field with placeholder appears
      | field   | placeholder                      |
      | Subtype | Start typing to select a subtype |
    When user types following value and selects matched option in the corresponding field
      | field        | value                                  |
      | Subtype      | Secondary Acute Myeloid Leukemia (AML) |
      | Stage        | Recurrent Acute Myeloid Leukemia (AML) |
      | Side Effects | JAK2 Gene Mutation                     |
    And user clicks "Find Trials" button
    Then the search is executed and results page is displayed
    And the url query has the following corresponding code
      | parameter | value                 |
      | t         | C3171                 |
      | loc       | 0                     |
      | rl        | 2                     |
      | st        | C25765                |
      | stg       | C148427\|C7882\|C9068 |
      | fin       | C84255                |

  Scenario: User is able to execute search for Cancer type, stage and side effects on Mobile
    Given user is navigating to "/about-cancer/treatment/clinical-trials/search/advanced"
    And screen breakpoint is set to "mobile"
    When user clicks on "all" field
    And user types "Acute Myeloid Leukemia (AML)" in the autosuggest field
    When user selects matched cancer type from autosuggest
    When user types following value and selects matched option in the corresponding field
      | field        | value                                  |
      | Stage        | Recurrent Acute Myeloid Leukemia (AML) |
      | Side Effects | JAK2 Gene Mutation                     |
    And user clicks "Find Trials" button
    Then the search is executed and results page is displayed
    And the url query has the following corresponding code
      | parameter | value                 |
      | t         | C3171                 |
      | loc       | 0                     |
      | rl        | 2                     |
      | stg       | C148427\|C7882\|C9068 |
      | fin       | C84255                |

  Scenario: User is able to execute search for Cancer type, subtype and side effects on desktop
    Given user is navigating to "/about-cancer/treatment/clinical-trials/search/advanced"
    When user clicks on "all" field
    And user types "Acute Myeloid Leukemia (AML)" in the autosuggest field
    When user selects matched cancer type from autosuggest
    Then field with placeholder appears
      | field   | placeholder                      |
      | Subtype | Start typing to select a subtype |
    When user types following value and selects matched option in the corresponding field
      | field        | value                                  |
      | Subtype      | Secondary Acute Myeloid Leukemia (AML) |
      | Side Effects | JAK2 Gene Mutation                     |
    And user clicks "Find Trials" button
    Then the search is executed and results page is displayed
    And the url query has the following corresponding code
      | parameter | value  |
      | t         | C3171  |
      | loc       | 0      |
      | rl        | 2      |
      | st        | C25765 |
      | fin       | C84255 |

  Scenario: User is able to execute search for Cancer type and side effects on desktop
    Given user is navigating to "/about-cancer/treatment/clinical-trials/search/advanced"
    When user clicks on "all" field
    And user types "Acute Myeloid Leukemia (AML)" in the autosuggest field
    When user selects matched cancer type from autosuggest
    Then field with placeholder appears
      | field   | placeholder                      |
      | Subtype | Start typing to select a subtype |
    When user types following value and selects matched option in the corresponding field
      | field        | value              |
      | Side Effects | JAK2 Gene Mutation |
    And user clicks "Find Trials" button
    Then the search is executed and results page is displayed
    And the url query has the following corresponding code
      | parameter | value  |
      | t         | C3171  |
      | loc       | 0      |
      | rl        | 2      |
      | fin       | C84255 |

