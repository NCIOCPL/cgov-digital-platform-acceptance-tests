Feature: As an user, I should be able to see my search results displayed, select and print them

    Scenario: Search results page displays general page components on desktop
        Given screen breakpoint is set to "desktop"
        Given user is navigating to "/research/participate/clinical-trials-search/r?loc=0&q=breast%20cancer&rl=2"
        Then page title is "Clinical Trials Search Results"
        And trial info displays "Results 1-10  of \d+ for your search.*"
        And "Show Search Criteria" button is displayed
        When user clicks on "Show Search Criteria" button
        Then "Hide Search Criteria" button is displayed
        And search criteria table displays the following
            | Category         | Selection     |
            | Keywords/Phrases | breast cancer |
        And "Start Over" link has a href "/research/participate/clinical-trials-search/advanced"
        And "Modify Search Criteria" button is displayed
        And "top" pager is displayed
        And "bottom" pager is displayed
        And result list is displayed
        And each result item is a link
        #There is a ticket for implementing the workaround for the commented step below
        #(https://github.com/NCIOCPL/cgov-digital-platform-acceptance-tests/issues/137)
        # And there are 2 delighters present
        And the following delighters are displayed
            | delighter    | href                                                       | title                              | text                                                                  |
            | cts-livehelp | /contact                                                   | Have a question?We're here to help | Chat with us: LiveHelpCall us: 1-800-4-CANCER(1-800-422-6237)         |
            | cts-which    | /research/participate/clinical-trials-search/steps | Which trials are right for you?    | Use the checklist in our guide to gather the information you’ll need. |

    Scenario: User is able to select results on mobile breakpoint
        Given screen breakpoint is set to "mobile"
        When user is navigating to "/research/participate/clinical-trials-search/r?loc=0&q=breast%20cancer&rl=2"
        Then page title is "Clinical Trials Search Results"
        And all result item's checkboxes are not checked
        And "Select all on page" checkbox is displayed
        When user selects "Select all on page" checkbox
        Then all result item's checkboxes are checked
        When user selects 1 result's checkbox
        Then "Select all on page" checkbox is not checked
        And 1 result's checkbox is not checked
        When user selects "Select all on page" checkbox
        Then "Select all on page" checkbox is checked
        And 1 result's checkbox is checked
        When user selects "Select all on page" checkbox
        Then all result item's checkboxes are not checked

#dissabling this scenario due to the Cypress cross origin restrictions - dissabling ChromeWebSecurity solution
#interferes with CTS API V2 security protocols
#until there is a solution, this scenario becomes a manual regression test
# Scenario: User is able to print results
#     Given screen breakpoint is set to "tablet"
#     Given user is navigating to "/about-cancer/treatment/clinical-trials/search/r?loc=0&q=breast%20cancer&rl=2"
#     Then page title is "Clinical Trials Search Results"
#     When user selects 1 result's checkbox
#     And user clicks on "Print Selected" button at "top" position
#     Then user is redirected to "/CTS.Print/Display" with generated "printid"
#     And page title is "Your Clinical Trials Search Results"
#     And print page search criteria table displays the following
#         | Category          | Selection     |
#         | Keywords/Phrases: | breast cancer |
#     And "New Search" link has a href "/about-cancer/treatment/clinical-trials/advanced-search"
#     And "Print" link has a href "javascript:window.print();"
#     And "E-Mail These Results" link has a "target" attribute with "_blank" value
#     And "Check for Updates" link has a href that matches "\/about-cancer\/treatment\/clinical-trials\/search\/v\?q=breast\+cancer&loc=0&rl=2&id=NCI-\d+-\d+"
