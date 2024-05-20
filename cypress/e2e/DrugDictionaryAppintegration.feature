Feature: Drug Dictionary app is integrated within CGOV platform


    Scenario: User is able to access a default (or “landing”) page that displays all of the expected Dictionary elements
        Given screen breakpoint is set to "desktop"
        Given user is navigating to "/publications/dictionaries/cancer-drug"
        Then page displays left navigation
        And page title is "NCI Drug Dictionary"
        And introductory text appears
        And search bar is displayed below the introductory text
        Then search options for "Starts with" and "Contains" are displayed
        And "starts with" is selected by default
        Then "Browse" option is displayed below search bar
        And browse option contains all alphabetic letters and "#" appears at the end of the list
        And each option appears as a link
        And the page is showing the expand results for letter "A"

    Scenario: User is able to view a definition page that displays all of the expected Dictionary elements
        Given screen breakpoint is set to "tablet"
        And user is navigating to "/publications/dictionaries/cancer-drug"
        When user clicks on result number 1
        Then user is redirected to definition page and url contains "def"
        And term title appears
        And term definition appears
        And the following links appear below definition text
            | href                                                                                                    |
            | https:\/\/www.cancer.gov\/about-cancer\/treatment\/clinical-trials\/intervention\/C[0-9]+               |
            | https:\/\/ncit\.nci\.nih\.gov\/ncitbrowser\/ConceptReport\.jsp\?dictionary=NCI%20Thesaurus&code=C[0-9]+ |
        Then the "H6" title is "Search NCI's Drug Dictionary"
        And search options for "Starts with" and "Contains" are displayed
        And "starts with" is selected by default
        Then "Browse" option is displayed below search bar

    Scenario: User is able to navigate to expand page and search for terms
        Given screen breakpoint is set to "mobile"
        And user is navigating to "/publications/dictionaries/cancer-drug/expand/W"
        Then the "H4" title is "XX results found for: W"
        When user types "can" in the search bar
        And browser waits for 500
        Then autosuggest appears
        When user hits "enter" key
        Then search is executed and page url is "/search/can/?searchMode=Begins"
        And the "H4" title is "XX results found for: can"

    Scenario: Negative - user is trying to go to non-existent definition page
        Given screen breakpoint is set to "desktop"
        When user is navigating to bad url "/publications/dictionaries/cancer-drug/def/chicken"
        Then status code is 404 on "https://webapis.cancer.gov/drugdictionary/v1/Drugs/chicken"
        And error page title is "Page Not Found"

    Scenario: No results found page
        Given screen breakpoint is set to "tablet"
        And user is navigating to "/publications/dictionaries/cancer-drug/search/chicken/?searchMode=Begins"
        Then the no matching results page is displayed

    Scenario: When user uses Autosuggest by selecting multiple suggestions and search - analytics events are fired
        Given screen breakpoint is set to "desktop"
        And user is navigating to "/publications/dictionaries/cancer-drug"
        Given analytics storage is cleared
        When user types "can" in the search bar
        And browser waits for 500
        And user selects "cannabidiol" from the dropdown
        And browser waits for 500
        And user clears the search box
        And user types "bev" in the search bar
        And browser waits for 500
        And user selects "bevacizumab" from the dropdown
        And browser waits for 500
        And user clicks "Search" button
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                                               |
            | event2    |                                                                     |
            | prop4     | D=pev1                                                              |
            | prop8     | english                                                             |
            | prop11    | Drug                                                                |
            | prop22    | bevacizumab                                                         |
            | prop23    | /Selected\|[1-9]\|10\|2\|3\|bev\|bevacizumab/                       |
            | prop24    | starts with                                                         |
            | prop67    | D=pageName                                                          |
            | evar2     | D=c8                                                                |
            | evar11    | D=c11                                                               |
            | evar26    | D=c24                                                               |
            | link      | Search                                                              |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/publications/dictionaries/cancer-drug |
            | pageName  | {CANONICAL_HOST}/publications/dictionaries/cancer-drug/             |

    Scenario: When user uses Autosuggest, modifies the suggestion and search -  analytics events are fired
        Given screen breakpoint is set to "desktop"
        And user is navigating to "/publications/dictionaries/cancer-drug"
        Given analytics storage is cleared
        When user types "bev" in the search bar
        And browser waits for 1000
        And user selects "bevacizumab" from the dropdown
        And browser waits for 1000
        And user modifies the search box value to "bevacizuma"
        And browser waits for 1000
        And user hits "enter" key
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                                               |
            | event2    |                                                                     |
            | prop4     | D=pev1                                                              |
            | prop8     | english                                                             |
            | prop11    | Drug                                                                |
            | prop22    | bevacizuma                                                          |
            | prop23    | /Modified\|[1-9]\|10\|1\|3\|bev\|bevacizumab/                       |
            | prop24    | starts with                                                         |
            | prop67    | D=pageName                                                          |
            | evar2     | D=c8                                                                |
            | evar11    | D=c11                                                               |
            | evar26    | D=c24                                                               |
            | link      | Search                                                              |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/publications/dictionaries/cancer-drug |
            | pageName  | {CANONICAL_HOST}/publications/dictionaries/cancer-drug/             |

    Scenario: When user does not use autosuggest and search -  analytics events are fired
        Given screen breakpoint is set to "desktop"
        And user is navigating to "/publications/dictionaries/cancer-drug"
        Given analytics storage is cleared
        When user selects "Contains" radio button
        And browser waits for 1000
        And user types "bev" in the search bar
        And browser waits for 1000
        And user clicks "Search" button
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                                               |
            | event2    |                                                                     |
            | prop4     | D=pev1                                                              |
            | prop11    | Drug                                                                |
            | prop22    | bev                                                                 |
            | prop23    | /Offered\|[1-9]\|10\|0\|undefined\|undefined\|undefined/            |
            | prop24    | contains                                                            |
            | prop67    | D=pageName                                                          |
            | evar2     | D=c8                                                                |
            | evar11    | D=c11                                                               |
            | evar26    | D=c24                                                               |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/publications/dictionaries/cancer-drug |
            | pageName  | {CANONICAL_HOST}/publications/dictionaries/cancer-drug/             |

    Scenario: When user clicks a term from result list -  analytics events are fired
        Given screen breakpoint is set to "mobile"
        And user is navigating to "/publications/dictionaries/cancer-drug/expand/A"
        When user clicks on result number 2
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                                                        |
            | event42   |                                                                              |
            | prop4     | D=pev1                                                                       |
            | prop8     | english                                                                      |
            | prop13    | 2                                                                            |
            | prop67    | D=pageName                                                                   |
            | link      | A-Hydrocort                                                                  |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/publications/dictionaries/cancer-drug/expand/A |
            | pageName  | {CANONICAL_HOST}/publications/dictionaries/cancer-drug/expand/A              |


    Scenario Outline: 404 handling with pre-render
        When user is navigating to bad url "<url>"
        Then status code is 404 on "<api>"
        And the page contains meta tags with the following names
            | name                  | content |
            | prerender-status-code | 404     |
        Examples:
            | url                                                | api                                                        |
            | /publications/dictionaries/cancer-drug/def/chicken | https://webapis.cancer.gov/drugdictionary/v1/Drugs/chicken |


    Scenario Outline: redirect handling with pre-render
        When user is navigating to "<url>"
        And the page contains meta tags with the following names
            | name                  | content           |
            | prerender-status-code | 301               |
            | prerender-header      | <prerenderHeader> |
        Examples:
            | url                                              | prerenderHeader                                                                                                   |
            | /publications/dictionaries/cancer-drug/def/39861 | Location: {PROTOCOL}://{CANONICAL_HOST}/publications/dictionaries/cancer-drug/def/hydrocortisone-sodium-succinate |
