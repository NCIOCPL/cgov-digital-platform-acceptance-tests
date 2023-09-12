Feature: As a user, I want to be able to use Basic Search form fields to find clinical trials

    Scenario Outline: When user visits Basic Search page, all page items are present in different breakpoints
        Given screen breakpoint is set to "<breakpoint>"
        Given user is navigating to "/research/participate/clinical-trials-search"
        Then page title is "Find NCI-Supported Clinical Trials"
        And the text "NCI-supported clinical trials are those sponsored or otherwise financially supported by NCI. See our guide, Steps to Find a Clinical Trial, to learn about options for finding trials not included in NCI's collection." appears below the title
        And "Steps to Find a Clinical Trial" link has a href "https://www.cancer.gov/about-cancer/treatment/clinical-trials/search/trial-guide"
        And Search tip icon is displayed and text "Search Tip: For more search options, use our advanced search." appears
        And "advanced search" link has a href "/research/participate/clinical-trials-search/advanced"
        And the following delighters are displayed
            | delighter    | href                                                       | title                              | text                                                                  |
            | cts-livehelp | /contact                                                   | Have a question?We're here to help | Chat with us: LiveHelpCall us: 1-800-4-CANCER(1-800-422-6237)         |
            | cts-what     | /about-cancer/treatment/clinical-trials/what-are-trials    | What Are Cancer Clinical Trials?   | Learn what they are and what you should know about them.              |
            | cts-which    | /about-cancer/treatment/clinical-trials/search/trial-guide | Which trials are right for you?    | Use the checklist in our guide to gather the information you’ll need. |

        Examples:
            | breakpoint |
            | desktop    |
            | mobile     |
            | tablet     |

    Scenario: User is able to search for and use autosuggested items for cancer type/keyword on desktop
        Given user is navigating to "/research/participate/clinical-trials-search"
        Then page title is "Find NCI-Supported Clinical Trials"
        And "Cancer Type/Keyword" input field has a placeholder "Start typing to select a cancer type or keyword"
        When user clicks on "Cancer Type/Keyword" field
        Then autocomplete dropdown is displayed
        When user types "breast cancer" in "Cancer Type/Keyword" field
        And user selects "Breast Cancer" from dropdown
        Then "Cancer Type/Keyword" input field has a value "Breast Cancer"
        When user clicks on "Find Trials" button
        Then the search is executed and results page is displayed
        And trial info displays "Results 1-10  of \d+ for your search.*"
        And the criteria table displays the following
            | Category                      | Selection     |
            | Primary Cancer Type/Condition | Breast Cancer |
        And the url query has the following corresponding code
            | parameter | value |
            | t         | C4872 |
            | loc       | 0     |
            | rl        | 1     |

    Scenario: Negative: User is searching for a keyword that does not exist on tablet
        Given screen breakpoint is set to "tablet"
        Given user is navigating to "/research/participate/clinical-trials-search"
        Then page title is "Find NCI-Supported Clinical Trials"
        And "Cancer Type/Keyword" input field has a placeholder "Start typing to select a cancer type or keyword"
        When user clicks on "Cancer Type/Keyword" field
        Then autocomplete dropdown is displayed
        When user types "asdf" in "Cancer Type/Keyword" field
        Then autocomplete dropdown is displayed with "No available options found. Your search will be based on the text above." text
        When user clicks on "Find Trials" button
        Then the search is executed and no results page is displayed
        And the url query has the following corresponding code
            | parameter | value |
            | q         | asdf  |
            | loc       | 0     |
            | rl        | 1     |

    Scenario: Negative: User is not able to search for age out of boundaries on Tablet
        Given user is navigating to "/research/participate/clinical-trials-search"
        And screen breakpoint is set to "tablet"
        Then page title is "Find NCI-Supported Clinical Trials"
        And "Age" form section is displayed
        When user types "0" in "Age" field
        Then alert "Please enter a number between 1 and 120." is displayed in "Age" section
        When user clears "Age" input field
        Then alert is not displayed in "Age" section
        When user types "121" in "Age" field
        Then alert "Please enter a number between 1 and 120." is displayed in "Age" section
        When user clicks on "Find Trials" button
        Then the search is not executed and path is "/research/participate/clinical-trials-search"

    Scenario: Negative: User is not able to search for an incorrect zip code on Mobile
        Given user is navigating to "/research/participate/clinical-trials-search"
        And screen breakpoint is set to "mobile"
        Then page title is "Find NCI-Supported Clinical Trials"
        And "U.S. ZIP Code" form section is displayed
        When user types "999g9" in "U.S. Zip Code" field
        Then alert "Please enter a valid 5 digit U.S. ZIP code" is displayed in "U.S. Zip Code" section
        And user clicks on "Find Trials" button
        Then the search is not executed and path is "/research/participate/clinical-trials-search"

    Scenario: User is able to search for all trials without specifying any criteria on desktop
        Given user is navigating to "/research/participate/clinical-trials-search"
        Then page title is "Find NCI-Supported Clinical Trials"
        And user clicks on "Find Trials" button
        Then the search is executed and results page is displayed
        And trial info displays "Results 1-10  of \d+ for your search for: \"all trials\".*"
        And the url query has the following corresponding code
            | parameter | value |
            | loc       | 0     |
            | rl        | 1     |

    Scenario: User is able to search for everything on tablet
        Given user is navigating to "/research/participate/clinical-trials-search"
        And screen breakpoint is set to "tablet"
        Then page title is "Find NCI-Supported Clinical Trials"
        When user types "30" in "Age" field
        When user types "22182" in "U.S. Zip Code" field
        When user types "aids" in "Cancer Type/Keyword" field
        And user clicks on "Find Trials" button
        Then the search is executed and results page is displayed
        Then trial info displays "Results 1-10  of \d+ for your search "
        And the criteria table displays the following
            | Category         | Selection |
            | Keywords/Phrases | aids      |
            | Age              | 30        |
            | Near ZIP Code    | 22182     |
        And the url query has the following corresponding code
            | parameter | value |
            | loc       | 1     |
            | rl        | 1     |
            | q         | aids  |
            | a         | 30    |
            | z         | 22182 |

    Scenario: User has an option to go to search results url directly and modify search on tablet
        Given user is navigating to "/research/participate/clinical-trials-search/r?a=30&loc=1&q=aids&rl=1&z=22182"
        And screen breakpoint is set to "tablet"
        Then trial info displays "Results 1-10  of \d+ for your search "
        And the criteria table displays the following
            | Category         | Selection |
            | Keywords/Phrases | aids      |
            | Age              | 30        |
            | Near ZIP Code    | 22182     |
        When user clicks on Modify Search Criteria button
        Then "Age" input field has a value "30"
        And "Keywords/Phrases" input field has a value "aids"
        And "U.S. Zip Code" input field has a value "22182"
