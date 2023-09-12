Feature: As an user, I should be able to see trial description page and all it's components.

    Scenario: Trial description page displays general page components
        Given user is navigating to "/research/participate/clinical-trials-search/r?loc=0&rl=2"
        Then page title is "Clinical Trials Search Results"
        And trial info displays "Results 1-10  of \d+ for your search for: \"all trials\""
        And "Show Search Criteria" button does not exist
        And "Start Over" link has a href "/research/participate/clinical-trials-search/advanced"
        And "Modify Search Criteria" button does not exist
        When user clicks on 1 result item link
        Then user is redirected to "/research/participate/clinical-trials-search/v" with query parameters that match "id=NCI-\d+-\d+&loc=0&rl=2"
        And "< Back to search results" link is displayed
        And "This clinical trial matches: \"all trials\"" text is displayed
        And "Start Over" link has a href "/research/participate/clinical-trials-search/advanced"
        And trial details accordion is displayed
        And "Description" section is expanded
        And "Open all" button is displayed
        And "Close all" button is displayed
        And option to "Print" trial is displayed
        And option to "Email" trial is displayed
        And there are 2 delighters present
        And the following delighters are displayed
            | delighter    | href                                                       | title                              | text                                                                  |
            | cts-livehelp | /contact                                                   | Have a question?We're here to help | Chat with us: LiveHelpCall us: 1-800-4-CANCER(1-800-422-6237)         |
            | cts-which    | /about-cancer/treatment/clinical-trials/search/trial-guide | Which trials are right for you?    | Use the checklist in our guide to gather the information you’ll need. |

    Scenario: Trial description page displays general page components on mobile
        Given screen breakpoint is set to "mobile"
        Given user is navigating to "/research/participate/clinical-trials-search/r?loc=0&q=breast%20cancer&rl=2"
        Then page title is "Clinical Trials Search Results"
        When user clicks on 1 result item link
        Then user is redirected to "/research/participate/clinical-trials-search/v" with query parameters that match "id=NCI-\d+-\d+&loc=0&q=breast%20cancer&rl=2"
        And "< Back to search results" link is displayed
        And "This clinical trial matches:" text is displayed
        And "Show Search Criteria" button is displayed
        When user clicks on "Show Search Criteria" button
        Then "Hide Search Criteria" button is displayed
        And search criteria table displayes the following
            | Category         | Selection     |
            | Keywords/Phrases | breast cancer |
        And "Start Over" link has a href "/research/participate/clinical-trials-search/advanced"
        And trial details accordion is displayed
        And "Description" section is expanded
        And "Open all" button is displayed
        And "Close all" button is displayed
        When user clicks on "Open all" button
        Then all trial details sections are expanded
        When user clicks on "Close all" button
        Then all trial details sections are collapsed
        And option to "Print" trial does not exist
        And option to "Email" trial is displayed
        And there are 2 delighters present
        And the following delighters are displayed
            | delighter    | href                                                       | title                              | text                                                                  |
            | cts-livehelp | /contact                                                   | Have a question?We're here to help | Chat with us: LiveHelpCall us: 1-800-4-CANCER(1-800-422-6237)         |
            | cts-which    | /about-cancer/treatment/clinical-trials/search/trial-guide | Which trials are right for you?    | Use the checklist in our guide to gather the information you’ll need. |