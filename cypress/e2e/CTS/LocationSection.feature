Feature: Location search

    Scenario: When user switch on the 'Veteran Affairs" toggle, then there are only three radio buttons displayed on mobile
        Given user is navigating to "/research/participate/clinical-trials-search/advanced"
        And screen breakpoint is set to "mobile"
        When user clicks on Limit results to Veterans Affairs facilities switch
        Then the following radio buttons are displayed
            | radioButton                                                          | visibility |
            | Search All Locations                                                 | displayed  |
            | ZIP Code                                                             | displayed  |
            | Country, State, City                                                 | displayed  |
            | Hospitals/Institutions                                               | none       |
            | At NIH (only show trials at the NIH Clinical Center in Bethesda, MD) | none       |


    Scenario: User is able to filter results using the Veteran Affairs switch on tablet
        Given user is navigating to "/research/participate/clinical-trials-search/advanced"
        And screen breakpoint is set to "tablet"
        When  user clicks on Limit results to Veterans Affairs facilities switch
        And user clicks "Find Trials" button
        Then the search is executed and results page is displayed
        And the url query has the following corresponding code
            | queryParam | value |
            | loc        | 0     |
            | rl         | 2     |
            | va         | 1     |


    Scenario: User is able to filter results by ZipCode on desktop
        Given user is navigating to "/research/participate/clinical-trials-search/advanced"
        When user selects "ZIP Code" radio button
        And user types "20105" in the ZipCode field
        And user selects "50 miles" in the Radius field
        And user clicks "Find Trials" button
        Then the search is executed and results page is displayed
        And the url query has the following corresponding code
            | queryParam | value |
            | loc        | 1     |
            | rl         | 2     |
            | z          | 20105 |
            | zp         | 50    |

    Scenario: User is able to filter results by Country, State, City on desktop
        Given user is navigating to "/research/participate/clinical-trials-search/advanced"
        When user selects "Country, State, City" radio button
        And user selects "United States" in the Country field
        And user types "Virginia" in the State field
        And user selects "Virginia" from autosuggest
        And user types "Arlington" in the City field
        And user clicks "Find Trials" button
        Then the search is executed and results page is displayed
        And the url query has the following corresponding code
            | queryParam | value         |
            | loc        | 2             |
            | rl         | 2             |
            | lcnty      | United States |
            | lcty       | Arlington     |

    Scenario: User is able to filter results by Hospitals/Institutions on mobile
        Given user is navigating to "/research/participate/clinical-trials-search/advanced"
        And screen breakpoint is set to "mobile"
        When user selects "Hospitals/Institutions" radio button
        And user types "Massachusetts General Hospital Cancer Center" in the Hospital field
        And user selects "Massachusetts General Hospital Cancer Center" from autosuggest
        And user clicks "Find Trials" button
        Then the search is executed and results page is displayed
        And the url query has the following corresponding code
            | queryParam | value                                        |
            | loc        | 3                                            |
            | rl         | 2                                            |
            | hos        | Massachusetts General Hospital Cancer Center |

    Scenario: User is able to filter results by atNIH on desktop
        Given user is navigating to "/research/participate/clinical-trials-search/advanced"
        When user selects "At NIH (only show trials at the NIH Clinical Center in Bethesda, MD)" radio button
        And user clicks "Find Trials" button
        Then the search is executed and results page is displayed
        And the url query has the following corresponding code
            | queryParam | value |
            | loc        | 4     |
            | rl         | 2     |