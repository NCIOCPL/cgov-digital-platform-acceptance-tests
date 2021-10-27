Feature: Tests for embed a content block

    Scenario Outline: Web site visitor views an Annual Plan page  and PDF link appears only on desktop and table
        Given user is navigating to "<url>"
        And screen breakpoint is set to "<screenBreakpoint>"
        Then the PDF download link should appear
        And a PDF icon located at "/profiles/custom/cgov_site/themes/custom/cgov/cgov_common/dist/images/sprites/svg-sprite.svg#file-pdf-blue-o-thick" should be displayed with a text "Annual Plan & Budget Proposal At A Glance"
        And clicking on the link will open a new window

        Examples:
            | screenBreakpoint | url                     |
            | desktop          | /special-report         |
            | tablet           | /espanol/special-report |

    Scenario: Web site visitor views an Annual Plan page  and PDF link is not shown on mobile
        Given user is navigating to "/special-report"
        And screen breakpoint is set to "mobile"
        Then the PDF download link is not displayed


    ##################### ContentBlock Analytics ####################

    Scenario: Click events for “Annual Plan & Budget Proposal At-A-Glance” file download button from the page (top link)
        Given user is navigating to "/special-report"
        And screen breakpoint is set to "desktop"
        When user clicks on top "Annual Plan & Budget Proposal At-A-Glance" button
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                   |
            | event52   |                                         |
            | prop4     | D=pev1                                  |
            | prop8     | english                                 |
            | prop66    | filedownload_icon                       |
            | prop67    | D=pageName                              |
            | evar2     | english                                 |
            | channel   | NCI Homepage                            |
            | pageName  | {CANONICAL_HOST}/special-report         |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/special-report |