Feature: Primary CancerType keyword search

  Scenario: User is able to search for cancer type via autosuggest on desktop
    Given user is navigating to "/research/participate/clinical-trials-search/advanced"
    When user clicks on "all" field
    Then cancer types dropdown is displayed
    And autosuggest component is displayed
    And placeholder text "Start typing to narrow options below" displayed

  Scenario: User is able to execute search for cancer type via autosuggest on tablet
    Given user is navigating to "//research/participate/clinical-trials-search/advanced"
    And screen breakpoint is set to "tablet"
    When user clicks on "all" field
    And user types "Breast Cancer" in the autosuggest field
    When user selects "Breast Cancer" from autosuggest
    And user clicks "Find Trials" button
    Then the search is executed and results page is displayed
    And trial info displays "Results 1-10  of \d+ for your search.*"
    And the url query has the following corresponding code
      | parameter | value |
      | t         | C4872 |
      | loc       | 0     |
      | rl        | 2     |

  Scenario: After selecting cancer type, Subtype, Stage, Side Effects fields appear on desktop
    Given user is navigating to "/research/participate/clinical-trials-search/advanced"
    When user clicks on "all" field
    And user types "Breast Cancer" in the autosuggest field
    When user selects "Breast Cancer" from autosuggest
    Then field with placeholder appears
      | field                                          | placeholder                      |
      | Subtype                                        | Start typing to select a subtype |
      | Stage                                          | Start typing to select a stage   |
      | Side Effects/Biomarkers/Participant Attributes | Examples: Nausea, BRCA1          |

  Scenario: User is able to execute search for Cancer type and subtype on Tablet
    Given user is navigating to "/research/participate/clinical-trials-search/advanced"
    And screen breakpoint is set to "tablet"
    When user clicks on "all" field
    And user types "Breast Cancer" in the autosuggest field
    When user selects "Breast Cancer" from autosuggest
    Then field with placeholder appears
      | field   | placeholder                      |
      | Subtype | Start typing to select a subtype |
    When user types following value and selects matched option in the corresponding field
      | field   | value                   |
      | Subtype | Bilateral Breast Cancer |
    And user clicks "Find Trials" button
    Then the search is executed and results page is displayed
    And trial info displays "Results 1-\d+  of \d+ for your search.*"
    And the url query has the following corresponding code
      | parameter | value |
      | t         | C4872 |
      | loc       | 0     |
      | rl        | 2     |
      | st        | C8287 |


  Scenario: User is able to execute search for Cancer type, subtype and stage on desktop
    Given user is navigating to "/research/participate/clinical-trials-search/advanced"
    When user clicks on "all" field
    And user types "Breast Cancer" in the autosuggest field
    When user selects "Breast Cancer" from autosuggest
    Then field with placeholder appears
      | field   | placeholder                      |
      | Subtype | Start typing to select a subtype |
    When user types following value and selects matched option in the corresponding field
      | field   | value                     |
      | Subtype | Bilateral Breast Cancer   |
      | Stage   | Early-Stage Breast Cancer |
    And user clicks "Find Trials" button
    Then the search is executed and results page is displayed
    And trial info displays "Results 1-\d+  of \d+ for your search.*"
    And the url query has the following corresponding code
      | parameter | value  |
      | t         | C4872  |
      | loc       | 0      |
      | rl        | 2      |
      | st        | C8287  |
      | stg       | C94774 |

  Scenario: User is able to execute search for Cancer type, subtype, stage and side effects on mobile
    Given user is navigating to "/research/participate/clinical-trials-search/advanced"
    And screen breakpoint is set to "mobile"
    When user clicks on "all" field
    And user types "Acute Myeloid Leukemia (AML)" in the autosuggest field
    When user selects "Acute Myeloid Leukemia (AML)" from autosuggest
    Then field with placeholder appears
      | field   | placeholder                      |
      | Subtype | Start typing to select a subtype |
    When user types following value and selects matched option in the corresponding field
      | field        | value                                  |
      | Subtype      | Acute Myeloid Leukemia (AML)           |
      | Stage        | Recurrent Acute Myeloid Leukemia (AML) |
      | Side Effects | High Risk Myelodysplastic Syndrome     |
    And user clicks "Find Trials" button
    Then the search is executed and results page is displayed
    And trial info displays "Results 1-\d+  of \d+ for your search.*"
    And the url query has the following corresponding code
      | parameter | value   |
      | t         | C3171   |
      | loc       | 0       |
      | rl        | 2       |
      | st        | C9154   |
      | st        | C9160   |
      | stg       | C148427 |
      | stg       | C7882   |
      | stg       | C9068   |
      | fin       | C138962 |
  
  Scenario: User is able to execute search for Cancer type, stage and side effects on Mobile
    Given user is navigating to "/research/participate/clinical-trials-search/advanced"
    And screen breakpoint is set to "mobile"
    When user clicks on "all" field
    And user types "Acute Myeloid Leukemia (AML)" in the autosuggest field
    When user selects "Acute Myeloid Leukemia (AML)" from autosuggest
    When user types following value and selects matched option in the corresponding field
      | field        | value                                  |
      | Stage        | Recurrent Acute Myeloid Leukemia (AML) |
      | Side Effects | High Risk Myelodysplastic Syndrome     |
    And user clicks "Find Trials" button
    Then the search is executed and results page is displayed
    And trial info displays "Results 1-\d+  of \d+ for your search.*"
    And the url query has the following corresponding code
      | parameter | value   |
      | t         | C3171   |
      | loc       | 0       |
      | rl        | 2       |
      | stg       | C148427 |
      | stg       | C7882   |
      | stg       | C9068   |
      | fin       | C138962 |
  
  Scenario: User is able to execute search for Cancer type, subtype and side effects on desktop
    Given user is navigating to "/research/participate/clinical-trials-search/advanced"
    When user clicks on "all" field
    And user types "Acute Myeloid Leukemia (AML)" in the autosuggest field
    When user selects "Acute Myeloid Leukemia (AML)" from autosuggest
    Then field with placeholder appears
      | field   | placeholder                      |
      | Subtype | Start typing to select a subtype |
    When user types following value and selects matched option in the corresponding field
      | field        | value                              |
      | Subtype      | Acute Myeloid Leukemia (AML)       |
      | Side Effects | High Risk Myelodysplastic Syndrome |
    And user clicks "Find Trials" button
    Then the search is executed and results page is displayed
    And trial info displays "Results 1-\d+  of \d+ for your search.*"
    And the url query has the following corresponding code
      | parameter | value   |
      | t         | C3171   |
      | loc       | 0       |
      | rl        | 2       |
      | st        | C9154   |
      | st        | C9160   |
      | fin       | C138962 |
  
  Scenario: User is able to execute search for Cancer type and side effects on desktop
    Given user is navigating to "/research/participate/clinical-trials-search/advanced"
    When user clicks on "all" field
    And user types "Acute Myeloid Leukemia (AML)" in the autosuggest field
    When user selects "Acute Myeloid Leukemia (AML)" from autosuggest
    Then field with placeholder appears
      | field   | placeholder                      |
      | Subtype | Start typing to select a subtype |
    When user types following value and selects matched option in the corresponding field
      | field        | value                              |
      | Side Effects | High Risk Myelodysplastic Syndrome |
    And user clicks "Find Trials" button
    Then the search is executed and results page is displayed
    And trial info displays "Results 1-\d+  of \d+ for your search.*"
    And the url query has the following corresponding code
      | parameter | value   |
      | t         | C3171   |
      | loc       | 0       |
      | rl        | 2       |
      | fin       | C138962 |
      
